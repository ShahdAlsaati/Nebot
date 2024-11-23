import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: Center(
        child: Text('places screen'),
      ),
    );  }
}
