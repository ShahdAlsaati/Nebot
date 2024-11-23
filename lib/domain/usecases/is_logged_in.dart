import 'package:dartz/dartz.dart';
import 'package:nebot/core/usecase/usecase.dart';
import '../../service_locater.dart';
import '../repositories/auth.dart';

class IsLoggedInUseCase implements UseCase<bool,dynamic>{

  @override
  Future<bool> call({dynamic param}) async{
    return await sl<AuthRepository>().isLoggedIn();
  }

}