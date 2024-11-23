import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nebot/main.dart';
import 'package:nebot/presentation/pages/guides/guide_details.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/countries.dart';
import '../layout/layout_page.dart';
import 'bloc/countries_display_cubit.dart';
import 'bloc/countries_state_cubit.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<SliderDrawerState> drawerKey; // Add drawer key

  HomeScreen({required this.drawerKey});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => _buildHomeContent(context));
          case '/guideDetails':
            return MaterialPageRoute(builder: (_) => GuideDetails());
          default:
            return MaterialPageRoute(builder: (_) => _buildHomeContent(context));
        }
      },
      initialRoute: '/',
    );
  }


  Widget _buildHomeContent(context){
    return BlocProvider(
      create: (context)=>CountriesDisplayCubit()..displayCountries(),

      child: Scaffold(
        backgroundColor: backgroundColor,

        body: Stack(
          children: [

            _buildBackground(),
            _buildCountrySelection(context),
            _buildTourGuidesCard(context),


          ],

        ),
      ),
    );

  }

  Widget _buildBackground() {
    return SvgPicture.asset(
      'assets/background/background1.svg',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildTourGuidesCard(BuildContext context) {
    return Positioned(
      left: 20.w,
      right: 20.w,
      top: 200.h,
      child: Center(
        child: Container(

          width: 320.w,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              _buildCardHeader(),
              SizedBox(height: 3.h),
              _buildGuideGrid(context),
              _buildPageIndicator(),
              SizedBox(height: 10.h),

            ],
          ),
        ),
      ),
    );
  }

  // Header row in the tour guide card
  Widget _buildCardHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.close,color: Colors.grey,),
          ],
        ),

        Text(
          'TRUSTED TOUR GUIDES',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Grid of guide avatars with name and star rating
  Widget _buildGuideGrid(context) {
    List<String> imageUrls = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0l9BD8MQ6YDwehKrBaHI_M0P4Et5sPiAt3Ng8-CFZRicwzgVUtZ5JBDS7vrp7zH1rFI4&usqp=CAU',
      'https://media.istockphoto.com/id/1317804584/photo/one-businesswoman-studio-portrait-looking-at-the-camera.jpg?s=612x612&w=0&k=20&c=Tx3nGQfxaI781gi97Siw7DIEBbKg1oBxl8n0JEwMQ6s=',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC6N6HFY0-tDcnEPiydEG_IBOigHSvnLrQ2TExfTC2X-4eRVUZ97UB2XVm49y9EWO6R1A&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR55pAiPEgwqlhdiKj0RPXvkD5enC8C6ktHLg&s',
      'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
      'https://www.shutterstock.com/image-photo/profile-picture-smiling-successful-young-260nw-2040223583.jpg',
      'https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl45siPdjFdtQSUFfHYYmxZoFGJ3tTAvQCU1dWV0TNJe-zjaU6Zr2HrMs1EaZ_W4DwV0o&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH2uf_wifKp7Sy76i0OUlzVp2JlWz7LXYRLQ&s',
    ];
    return SizedBox(
      height: 345.h,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GuideDetails()),
              );
            },
            child: Column(
              children: [
                Container(
                    width: 70.0.w,
                    height: 70.0.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,  // Ensures it's circular
                      border: Border.all(
                        color: primaryColor,  // Set border color
                        width: 4.0,  // Set border width
                      ),
                    ),
                    child: Container(
                      width: 70.0,  // Adjust size as needed
                      height: 70.0, // Adjust size as needed
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,  // Ensures it's circular
                        border: Border.all(
                          //
                          color: Colors.transparent, // Set border color
                          width: 2.0,  // Set border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(imageUrls[index]),
                        backgroundColor: primaryColor,
                      ),
                    )

                ),
                SizedBox(height: 2.h),
                Text('Guide Name', style: TextStyle(fontSize: 10.sp)),
                _buildStarRating(),
              ],
            ),
          );
        },
      ),
    );
  }

  // Star rating row for each guide
  Widget _buildStarRating() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) => Icon(Icons.star, color: starColor, size: 10.r)),
    );
  }

  // Page indicator dots for guide card
  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
            (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0.w),
          width: 8.0.w,
          height: 8.0.h,
          decoration: BoxDecoration(
            color: index == 0 ? Colors.blue : Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
  // Country selection row with a dropdown and flag icon
  Widget _buildCountrySelection(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height*0.17,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.only(top: 36.0,right: 18,left: 18,bottom: 9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => drawerKey.currentState?.openSlider(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/greece_flag.png'),
                    ),
                    Text('Greece',style: TextStyle(color: Colors.grey),)
                  ],

                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration:  InputDecoration(
                    labelText:  'COUNTRY NAME',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp, // Adjust the size to make it smaller
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),

                  items: ['Greece', 'Italy', 'France']
                      .map((country) =>
                      DropdownMenuItem(child: Text(country), value: country))
                      .toList(),
                  onChanged: (value) {},
                  dropdownColor: Colors.white,
                ),
              ),
              SizedBox(width: 10.w,)
            ],
          ),
        ),
      ),
    );
  }
  // Custom bottom navigation bar with icons and labels
  
}
