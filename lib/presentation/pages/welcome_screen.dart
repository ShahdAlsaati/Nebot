import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import 'layout/layout_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<SliderDrawerState> _drawerKey = GlobalKey<SliderDrawerState>();

  @override
  void initState() {
    super.initState();
    // Delay of 2 seconds before navigating to HomeScreen
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => layoutPage(drawerKey: _drawerKey,)),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImages(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImages() {
    return Stack(
      children: [
        _buildBackgroundImage('assets/background/background1.svg'),
        _buildBackgroundImage('assets/background/grad.svg'),
      ],
    );
  }

  Widget _buildBackgroundImage(String assetPath) {
    return SvgPicture.asset(
      assetPath,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLottieAnimation(),
           SizedBox(height: 20.h),
          _buildWelcomeText(),
           SizedBox(height: 8.h),
          _buildTaglineText(),
        ],
      ),
    );
  }

  Widget _buildLottieAnimation() {
    return Container(
      color: Colors.transparent,
      child: Lottie.asset('assets/welcome/check.json'),
    );
  }

  Widget _buildWelcomeText() {
    return const Text(
      'WELCOME TO NEBOT!',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }

  Widget _buildTaglineText() {
    return const Text(
      'Dream. Plan. Explore. Enjoy.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}
