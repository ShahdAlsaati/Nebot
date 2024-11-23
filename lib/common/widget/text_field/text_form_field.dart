import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText = false;
   TextFormFieldWidget({super.key,required this.label,required this.controller,required this.keyboardType,obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label cannot be empty";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );

  }
}
