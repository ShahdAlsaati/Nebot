import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnakeBarMessage{
  void showSuccessSnakeBar({required String message,required BuildContext context}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message,style: const TextStyle(
        color: Colors.white,
      ),),
        backgroundColor: Colors.green,
      ),

    );
  }
  void showErrorSnakeBar({required String message,required BuildContext context}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message,style: const TextStyle(
        color: Colors.white,
      ),),
        backgroundColor: Colors.redAccent,
      ),

    );
  }

}