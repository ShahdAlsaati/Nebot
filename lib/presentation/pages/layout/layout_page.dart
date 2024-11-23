import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nebot/core/theme/app_theme.dart';
import 'package:nebot/presentation/pages/explore/explore_screen.dart';
import 'package:nebot/presentation/pages/home/home_screen.dart';
import 'package:nebot/presentation/pages/place/places_screen.dart';
import 'package:nebot/presentation/pages/profile/my_profile_screen.dart';

import '../../../common/bloc/nav_bar/nav_bar_bloc.dart';
import '../../../domain/entities/countries.dart';
import '../home/bloc/countries_display_cubit.dart';
import '../home/bloc/countries_state_cubit.dart';


class LayoutPage extends StatefulWidget {
  Color color=backgroundColor;
   LayoutPage({super.key, color});

  @override
  State<LayoutPage> createState() => _LayoutPageState();

}

class _LayoutPageState extends State<LayoutPage> {
  late PageController pageController;
  final GlobalKey<SliderDrawerState> _drawerKey = GlobalKey<SliderDrawerState>();
  final int guideDetailsPageIndex = 4;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 2);

    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(2);

  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  List<Widget> get topLevelPages => [
    ExploreScreen(),
    MyProfileScreen(),
    HomeScreen(drawerKey: _drawerKey),
    PlacesScreen(),
  ];
  final List<Color> backgroundColors = [
    backgroundColor,  // Background for ExploreScreen
    backgroundColor, // Background for MyProfileScreen
    backgroundColor, // Background for HomeScreen
    backgroundColor, // Background for PlacesScreen
  ];
  void navigateToGuideDetails() {
    pageController.jumpToPage(guideDetailsPageIndex);
    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(guideDetailsPageIndex);
  }

  void onPageChanged(int page) {
    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
  }


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => CountriesDisplayCubit()..displayCountries(),
      child: Material(
        color: Colors.white.withOpacity(0.9),
        elevation: 20.0,
        shadowColor: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(0), // Optional, for rounded corners
        child: SliderDrawer(
          key: _drawerKey,
          appBar: SliderAppBar(
            appBarHeight: 0,
          ),
          sliderBoxShadow:
          SliderBoxShadow(

            blurRadius: 30,
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 30
          ) ,
          sliderOpenSize: MediaQuery.of(context).size.width * 0.25,
          slider: BlocBuilder<CountriesDisplayCubit, CountriesDisplayState>(
            builder: (context, state) {
              if (state is CountriesLoading) {
                return Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }

              if (state is CountriesLoaded) {
                return _buildCountryDrawer(context, state.countryEntities);
              }

              if (state is CountriesLoadedFailure) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }

              return Container();
            },
          ),
          child: Scaffold(
            extendBody: true,
            backgroundColor: widget.color, // Update color based on page index
            body: _mainWrapperBody(),
            bottomNavigationBar: _mainWrapperBottomNavBar(context),
            floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
            floatingActionButton: _mainWrapperFab(),
          ),
        ),
      ),
    );
  }

  Widget _buildCountryDrawer(BuildContext context, List<CountryEntity> countryEntities) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 40),
      itemCount: countryEntities.length,
      itemBuilder: (context, index) {
        final country = countryEntities[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Material(
                  borderRadius: BorderRadius.circular(50),
                  child: _buildCountryListTile("https://nebot.synked.cloud/storage/app/${country.image}",() => _drawerKey.currentState?.closeSlider())),
              SizedBox(height: 5.h,),
              Text(country.name,style: TextStyle(color: Colors.black,fontSize: 12.sp,decoration: TextDecoration.none,),)
            ],
          ),
        );
      },
    );
  }
  Widget _buildCountryListTile(String assetPath, VoidCallback onTap) {
    return InkWell(

      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.white,  // Set border color
              width: 4.0,  // Set border width
            ),
          ),
          child: CircleAvatar(backgroundImage: NetworkImage(assetPath),radius: 33,)),
      onTap: onTap,
    );
  }

  Widget _mainWrapperBottomNavBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0,right: 4.0,top: 4.0),
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
          boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),

          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _bottomAppBarItem(
                        context,
                        defaultIcon: SvgPicture.asset('assets/nav_bar_icon/explore.svg',color: Colors.grey,width: 23.w,height: 23.h,),
                        page: 0,
                        label: "Explore",
                        filledIcon:SvgPicture.asset('assets/nav_bar_icon/explore.svg',color: backgroundColor,width: 23.w,height: 23.h,),
                      ),


                      _bottomAppBarItem(
                        context,
                        defaultIcon: SvgPicture.asset('assets/nav_bar_icon/profile.svg',color: Colors.grey,width: 23.w,height: 23.h,),
                        page: 1,
                        label: "My Profile",
                        filledIcon:SvgPicture.asset('assets/nav_bar_icon/profile.svg',color: backgroundColor,width: 23.w,height: 23.h,),
                      ),

                      _bottomAppBarItem(
                        context,
                        defaultIcon: SvgPicture.asset('assets/nav_bar_icon/guides.svg',color: Colors.grey,width: 23.w,height: 23.h,),
                        page: 2,
                        label: "Guides",
                        filledIcon: SvgPicture.asset('assets/nav_bar_icon/guides.svg',color: backgroundColor,width: 23.w,height: 23.h,),
                      ),
                      _bottomAppBarItem(
                        context,
                        defaultIcon: SvgPicture.asset('assets/nav_bar_icon/places.svg',color: Colors.grey,width: 23.w,height: 23.h,),
                        page: 3,
                        label: "Places",
                        filledIcon: SvgPicture.asset('assets/nav_bar_icon/places.svg',color: backgroundColor,width: 23.w,height: 23.h,),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  width: 40.w,
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Floating Action Button - MainWrapper Widget
  FloatingActionButton _mainWrapperFab() {
    return FloatingActionButton.small(

      onPressed: () {},
      child: Icon(Icons.add),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }



  PageView _mainWrapperBody() {
    return PageView(
      onPageChanged: (int page) => onPageChanged(page),
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),  // Disable swipe gesture
      children: topLevelPages,
    );
  }

  Widget _bottomAppBarItem(
      BuildContext context, {
        required SvgPicture defaultIcon,  // Change from Icon to SvgPicture
        required int page,
        required String label,
        required SvgPicture filledIcon, // Change from Icon to SvgPicture
      }) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);

        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 10),
            curve: Curves.fastLinearToSlowEaseIn);
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
              height: 2.h,
            ),
            context.watch<BottomNavCubit>().state == page
                ? filledIcon // Use SvgPicture directly
                : defaultIcon, // Use SvgPicture directly
            const SizedBox(
              height: 3,
            ),
            Text(
              label,
              style: TextStyle(
                color: context.watch<BottomNavCubit>().state == page
                    ? backgroundColor
                    : Colors.grey,
                  fontSize: 11.sp,
                fontWeight: context.watch<BottomNavCubit>().state == page
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }


}