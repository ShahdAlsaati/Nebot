import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: Center(
        child: Text('my profile screen'),
      ),
    );
  }
}
