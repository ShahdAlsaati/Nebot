import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nebot/common/local/cache_helper.dart';
import 'package:nebot/core/constants/api_urls.dart';
import 'package:nebot/core/network/dio_client.dart';

import '../../service_locater.dart';
import '../models/login_req_params.dart';
import '../models/signup_req_params.dart';

abstract class AuthApiService{
  Future<Either<dynamic,Response>> signup(SignupReqParams signupReq);
  Future<Either> getCountries();
  Future<Either> login(LoginReqParams loginReq);
}

class AuthApiServiceImpl extends AuthApiService{
  @override
  Future<Either<dynamic,Response>> signup(SignupReqParams signupReq)async {
    try{
     var response= await sl<DioClient>().post(
        ApiUrls.register,
        data: signupReq.toMap()
      );
     return Right(response);
    }
    on DioException catch (e) {
      // Handling the error and returning the error message
      print('DioError: ${e.message}');
      if (e.response != null) {
        print('Response Data: ${e.response?.data}');
        return Left(e.response?.data["message"] ?? "Unknown error");
      } else {
        return Left("An unknown error occurred");
      }
    } catch (e) {
      // Catching any other errors and returning a generic message
      print('Error: $e');
      return Left("An error occurred");
    }
  }

  @override
  Future<Either> getCountries() async{
    try{
      var response= await sl<DioClient>().get(
          ApiUrls.countries,
          options: Options(
            headers: {
              'Authorization':'Bearer 8|EtKl8SthPMZNiOuDVBQBQhoSrIlVbrGC92ZKwnsQ10ca9496'
            }
          )
      );
      return Right(response);
    } on DioException catch(e){
      return Left(e.response?.data["message"]);

    }
  }

  @override
  Future<Either> login(loginReq) async{
    try{
      var response= await sl<DioClient>().post(
          ApiUrls.login,
          data: loginReq.toJson()
      );
      return Right(response);
    }
    on DioException catch (e) {
      // Handling the error and returning the error message
      print('DioError: ${e.message}');
      if (e.response != null) {
        print('Response Data: ${e.response?.data}');
        return Left(e.response?.data["message"] ?? "Unknown error");
      } else {
        return Left("An unknown error occurred");
      }
    } catch (e) {
      // Catching any other errors and returning a generic message
      print('Error: $e');
      return Left("An error occurred");
    }
  }

}