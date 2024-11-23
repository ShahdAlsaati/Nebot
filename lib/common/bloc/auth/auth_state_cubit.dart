import 'package:bloc/bloc.dart';
import 'package:nebot/common/bloc/auth/auth_state.dart';
import 'package:nebot/domain/usecases/is_logged_in.dart';

import '../../../service_locater.dart';

class AuthStateCubit extends Cubit<AuthState>{
  AuthStateCubit():super(AppInitialState());

  void appStarted()async{
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if(isLoggedIn){
      emit(Authenticated());

    }
    else{
      emit(UnAuthenticated());
    }
  }
}