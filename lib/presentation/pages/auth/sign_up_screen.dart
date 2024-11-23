import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nebot/core/theme/app_theme.dart';
import 'package:nebot/presentation/pages/welcome_screen.dart';
import 'package:image_picker/image_picker.dart'; // Import image picker
import 'package:nebot/common/widget/botton/basic_app_button.dart';
import 'package:nebot/data/models/signup_req_params.dart';
import 'package:nebot/domain/usecases/sign_up.dart';
import '../../../common/bloc/button/button_state_cubit.dart';
import '../../../common/bloc/button/button_state.dart';
import '../../../common/widget/text_field/text_form_field.dart';
import '../../../service_locater.dart';
import '../layout/layout_page.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Country selectedCountry = Country(
    phoneCode: "963",
    countryCode: "SY",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Syria",
    example: "+963944444444",
    displayName: "Syria (+963)",
    displayNameNoCountryCode: "Syria",
    e164Key: "SY+963",
  );

  File? _selectedImage; // Field to store selected image
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
            }
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              print(state.errorMessage);

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/background/background1.svg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
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
                                  icon: Icon(Icons.arrow_back,color: backgroundColor),
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
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "We would like to know you a bit more",
                                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 40),
                      Align(
                        alignment: Alignment.bottomCenter,

                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "NEW ACCOUNT",
                                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),

                                    InkWell(
                                      onTap: _pickImage, // Open gallery on tap
                                      child: Container(
                                        width: 96.w, // Set desired size for the avatar
                                        height: 96.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.shade300,
                                          border: Border.all(
                                            color: Colors.grey.shade400, // Border color
                                            width: 3.0.w,         // Border width
                                            style: BorderStyle.solid, // Border style: solid, none, or dashed (if using a custom solution)
                                          ),
                                          image: _selectedImage != null
                                              ? DecorationImage(
                                            image: FileImage(_selectedImage!),
                                            fit: BoxFit.cover, // Ensures the image covers the area without distortion
                                          )
                                              : null,
                                        ),
                                        child: _selectedImage == null
                                            ? Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 48.r, // Set a smaller size for the camera icon
                                        )
                                            : null, // Show camera icon only if no image is selected
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                TextFormFieldWidget(label: "Email",controller:  _emailController, keyboardType: TextInputType.emailAddress),
                                SizedBox(height: 10.h),
                                TextFormFieldWidget(label: "Username",controller:  _usernameController,keyboardType:  TextInputType.text),
                                SizedBox(height: 10.h),
                                TextFormFieldWidget(label: "Password",controller:  _passwordController,keyboardType:  TextInputType.visiblePassword, obscureText: true),
                                SizedBox(height: 10.h),
                                _buildPhoneNumberField(),
                                SizedBox(height: 30),
                                Builder(
                                  builder: (context) {
                                    return BasicAppButton(
                                      onPressed: (){

                                        print("Signup Parameters: ${SignupReqParams(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          name: _usernameController.text,
                                          phone: _phoneController.text,
                                          image: _selectedImage?.path,
                                          phone_prefix: '+${selectedCountry.phoneCode}',
                                        ).toMap()}");
                                        if(_selectedImage==null)
                                          {

                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please choose image'),),);
                                            return;
                                          }
                                        if (_formKey.currentState?.validate() ?? false) {
                                          // Proceed if all fields are valid
                                          context.read<ButtonStateCubit>().excute(
                                            usecase: sl<SignUpUseCase>(),
                                            params: SignupReqParams(
                                              email: _emailController.text,
                                              password: _passwordController.text,
                                              name: _usernameController.text,
                                              phone: _phoneController.text,
                                              phone_prefix:"+${selectedCountry.phoneCode}" ,
                                              image: _selectedImage?.path,
                                            ),
                                          );
                                        } else {
                                          // Show a snackbar or alert if validation fails
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Please fill in all required fields")),
                                          );
                                        }
                                      },
                                      title: "SIGN UP",
                                    );
                                  },
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an account? "),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                      },
                                      child: Text(
                                        "Log in",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
    );
  }


  Widget _buildPhoneNumberField() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Phone number cannot be empty";
        }
        return null;
      },
      decoration: InputDecoration(

        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),

        labelText: "Phone number",
        prefixIcon: InkWell(
          onTap: () {
            showCountryPicker(
              showPhoneCode: true,
              countryListTheme: CountryListThemeData(bottomSheetHeight: 400),
              context: context,
              onSelect: (Country country) {
                setState(() {
                  selectedCountry = country;
                });
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8,top: 18),
            child: Text(
              "+${selectedCountry.phoneCode} | ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
