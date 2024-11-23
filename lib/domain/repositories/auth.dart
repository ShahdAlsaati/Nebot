import 'package:dartz/dartz.dart';
import 'package:nebot/data/models/login_req_params.dart';
import 'package:nebot/data/models/signup_req_params.dart';

abstract class AuthRepository{

  Future<Either> signup(SignupReqParams signupReq);

  Future<Either> login(LoginReqParams loginReq);

  Future<bool> isLoggedIn();

  Future<Either> getCountries();



}