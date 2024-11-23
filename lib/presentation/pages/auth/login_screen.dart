import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nebot/common/widget/base_screen/base_screen.dart';
import 'package:nebot/common/widget/botton/basic_app_button.dart';
import 'package:nebot/data/models/login_req_params.dart';
import 'package:nebot/domain/usecases/login.dart';
import 'package:nebot/presentation/pages/auth/sign_up_screen.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../common/bloc/button/button_state_cubit.dart';
import '../../../common/widget/text_field/text_form_field.dart';
import '../../../service_locater.dart';
import '../layout/layout_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context)=>ButtonStateCubit(),

        child:  BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context,state){
            print("Button State: $state");

            if (state is ButtonSuccessState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LayoutPage()),
                    (Route<dynamic> route) => false, // This removes all the previous routes
              );
            }
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              print(state.errorMessage);

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },

          child:  Form(
            key: _formKey,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/background/background1.svg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover, // Make the image cover the whole screen
                  ),

                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(

                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back, color: Colors.blue,),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                Text(
                                  "WELCOME,",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top: 10.0.h),
                                  child: Text(
                                    "We would like to know you a bit more",
                                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Container(
                          height:MediaQuery.of(context).size.height*0.7 ,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              Row(
                                children: [
                                  Text(
                                    "LOGIN",
                                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),

                                ],
                              ),
                              SizedBox(height: 20.h),
                              TextFormFieldWidget(label: "Email",controller:  _emailController, keyboardType: TextInputType.emailAddress),
                              SizedBox(height: 10.h),

                              TextFormFieldWidget(label: "Password",controller:  _passwordController,keyboardType:  TextInputType.visiblePassword, obscureText: true),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextButton(onPressed: (){}, child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Colors.blue
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(height: 30.h),

                              Builder(
                                builder: (context) {
                                  return BasicAppButton(
                                    title: 'LOGIN',
                                    onPressed: (){
                                      print("login Parameters: ${LoginReqParams(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        token_device: '21211'
                                      ).toJson()}");

                                      if (_formKey.currentState?.validate() ?? false) {
                                        // Proceed if all fields are valid
                                        context.read<ButtonStateCubit>().excute(
                                          usecase: sl<LoginUseCase>(),
                                          params: LoginReqParams(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                              token_device: '21211'
                                          ),
                                        );
                                      } else {
                                        // Show a snackbar or alert if validation fails
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Please fill in all required fields")),
                                        );
                                      }
                                    },

                                  );
                                }
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account? "),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>  RegistrationScreen()),
                                      );                              },
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:MediaQuery.of(context).size.height*0.1,

                              )

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
