import 'package:dartz/dartz.dart';
import 'package:nebot/core/usecase/usecase.dart';
import 'package:nebot/data/models/login_req_params.dart';
import 'package:nebot/data/models/signup_req_params.dart';
import 'package:nebot/domain/repositories/auth.dart';

import '../../service_locater.dart';

class LoginUseCase implements UseCase<Either,LoginReqParams>{

  @override
  Future<Either> call({LoginReqParams? param}) async{
    return await sl<AuthRepository>().login(param!);
  }

}