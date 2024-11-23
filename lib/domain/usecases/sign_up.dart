import 'package:dartz/dartz.dart';
import 'package:nebot/core/usecase/usecase.dart';
import 'package:nebot/data/models/signup_req_params.dart';
import 'package:nebot/domain/repositories/auth.dart';

import '../../service_locater.dart';

class SignUpUseCase implements UseCase<Either,SignupReqParams>{

  @override
  Future<Either> call({SignupReqParams? param}) async{
     return await sl<AuthRepository>().signup(param!);
  }

}