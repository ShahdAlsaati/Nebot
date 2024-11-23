import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nebot/data/datasources/auth_api_service.dart';
import 'package:nebot/data/datasources/auth_local_service.dart';
import 'package:nebot/data/models/countries.dart';
import 'package:nebot/data/models/login_req_params.dart';
import '../../common/local/cache_helper.dart';
import '../../domain/repositories/auth.dart';
import '../../service_locater.dart';
import '../models/signup_req_params.dart';


class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signup(SignupReqParams signupReq) async {
    Either result = await sl<AuthApiService>().signup(signupReq);
    return result.fold(
            (error){
          return Left(error);
        },
            (data) async {
          Response response = data;
          CacheHelper.saveData(key: 'token',value:  response.data['data']['token']);
          return Right(response);
        }
    );
  }

  @override
  Future<bool> isLoggedIn()async {

    return await sl<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> getCountries() async {
    Either result = await sl<AuthApiService>().getCountries();
    return result.fold(
          (error) {
        return Left(error);
      },
          (data) async {
        Response response = data;

        // Assuming response.data has the structure { "data": { "countries": [...] } }
        if (response.data['data'] != null && response.data['data']['countries'] is List) {
          List countriesData = response.data['data']['countries'];

          List<CountryModel> countriesModel = countriesData
              .map<CountryModel>((item) => CountryModel.fromMap(item))
              .toList();

          var countriesEntity = countriesModel.map((country) => country.toEntity()).toList();
          return Right(countriesEntity);
        } else {
          return Left("Invalid data format"); // Handle unexpected structure
        }
      },
    );
  }

  @override
  Future<Either> login(LoginReqParams loginReq) async{
    Either result = await sl < AuthApiService > ().login(loginReq);
    return result.fold(
            (error) {
          return Left(error);
        },
            (data) async {
          Response response = data;
          CacheHelper.saveData(key: 'token', value: response.data['data']['token']);
          return Right(response);
        }
    );
  }

}