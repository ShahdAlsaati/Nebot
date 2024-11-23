import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nebot/common/widget/base_screen/base_screen.dart';
import 'package:nebot/core/theme/app_theme.dart';
import 'package:nebot/presentation/pages/auth/sign_up_screen.dart';
import 'auth/login_screen.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImages(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildWelcomeText(),
                 SizedBox(height: 20.h),
                _buildSignUpButton(context),
                 SizedBox(height: 10.h),
                _buildLoginButton(context),
                 SizedBox(height: 90.h),
                _buildSocialSignInText(),
                 SizedBox(height: 20.h),
                _buildSocialMediaIcons(),
                 SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImages() {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/background/background1.svg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        SvgPicture.asset(
          'assets/background/grad.svg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children:  [
        Text(
          'HI Nebot',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.sp,
          ),
        ),
        Text(
          'Ready to explore the world?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistrationScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child:  Padding(
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 50.w),
        child: Text(
          "SIGN UP",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child:  Padding(
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 50.w),
        child: Text(
          "LOG IN",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSocialSignInText() {
    return  Text(
      'OR SIGN IN WITH',
      style: TextStyle(
        color: Colors.white,
        fontSize: 10.sp,
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset('assets/first_screen/apple.svg'),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset('assets/first_screen/google.svg'),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset('assets/first_screen/facebook.svg',width: 3,height: 3,),
            ),
          ),
        ),

      ]
    );
  }
}
