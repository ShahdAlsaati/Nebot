import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/countries.dart';
import 'home/bloc/countries_display_cubit.dart';
import 'home/bloc/countries_state_cubit.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context)=>CountriesDisplayCubit()..displayCountries(),
        child: BlocBuilder<CountriesDisplayCubit,CountriesDisplayState>(
      
            builder: (context,state)  {
              if(state is CountriesLoading)
              {
                return Center(child: Column(
                  children: [
                    CircularProgressIndicator(color: Colors.orangeAccent,),
                    Text('is loading...')
                  ],
                ));
              }
              if (state is CountriesLoaded) {
                return _buildCountryDrawer(context, state.countryEntities);
              }

              if(state is CountriesLoadedFailure)
              {
                return Text(state.errorMessage);
              }
              return Container();
      
            }
        ),
      ),
    );

  }
  Widget _buildCountryDrawer(BuildContext context, List<CountryEntity> countryEntities) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: countryEntities.length,
        itemBuilder: (context, index) {
          final country = countryEntities[index];
          return Column(
            children: [
              Image.network("https://nebot.synked.cloud/storage/app/${country.image}"),  // Display image from URL
              Text(country.name),  // Display country name
            ],
          );
        },
      ),
    );
  }

}
