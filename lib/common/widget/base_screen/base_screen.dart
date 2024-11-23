import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nebot/core/theme/app_theme.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;

  const BaseScreen({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content passed as child
          child,
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }

  Widget _buildBottomNavBar() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 4.0.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.r),
            topLeft: Radius.circular(50.r),
          ),
          boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0.r)),
          child: BottomAppBar(
            color: Colors.white,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem('assets/explore.png', 'Explore'),
                _buildNavItem('assets/profile.png', 'My Profile'),
                _buildNavItem('assets/guides.png', 'Guides'),
                _buildNavItem('assets/place.png', 'Places'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String assetPath, String label) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetPath, width: 24.w, height: 24.h),
          SizedBox(height: 4.h),
          Text(label, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }
}
