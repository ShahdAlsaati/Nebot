import 'package:dartz/dartz.dart';
import 'package:nebot/core/usecase/usecase.dart';
import 'package:nebot/data/models/signup_req_params.dart';
import 'package:nebot/domain/repositories/auth.dart';

import '../../service_locater.dart';

class GetCountriesUseCase implements UseCase<Either,dynamic>{

  @override
  Future<Either> call({dynamic param}) async{
    return await sl<AuthRepository>().getCountries();
  }

}