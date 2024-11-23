import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nebot/main.dart';

import '../../bloc/button/button_state.dart';
import '../../bloc/button/button_state_cubit.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double ? height;
  final double ? width;
  const BasicAppButton({
    required this.onPressed,
    this.title = '',
    this.height,
    this.width,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit,ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState){
          return _loading(context);
        }
        return _initial(context);
      },
    );
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(

        onPressed: null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.white,
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),

        child: const CircularProgressIndicator(color: Colors.orange,)
    );


  }

  Widget _initial(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff3461FD).withOpacity(0.8),
              offset: const Offset(0, 5),
              blurRadius: 17,
            )
          ]
      ),
      child: ElevatedButton(

          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),

            ),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 15.h, horizontal: 50.w),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
      ),
    );
  }
}