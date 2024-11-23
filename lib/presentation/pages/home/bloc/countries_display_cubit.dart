import 'package:bloc/bloc.dart';
import 'package:nebot/domain/usecases/get_countries.dart';
import 'package:nebot/presentation/pages/home/bloc/countries_state_cubit.dart';

import '../../../../service_locater.dart';

class CountriesDisplayCubit extends Cubit<CountriesDisplayState>{
  CountriesDisplayCubit():super(CountriesLoading());

  void displayCountries() async {
    var result = await sl<GetCountriesUseCase>().call();
    result.fold(
          (error) {
        emit(CountriesLoadedFailure(errorMessage: error.toString()));
      },
          (data) {
        emit(CountriesLoaded(countryEntities: data)); // Pass the list here
      },
    );
  }

}