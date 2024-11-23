import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:nebot/common/bloc/button/button_state.dart';
import 'package:nebot/core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState>{
  ButtonStateCubit():super(ButtonInitialState());

  void excute({dynamic params,required UseCase usecase})async{
    emit(ButtonLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try{
      Either result=await usecase.call(param: params);
      print(result);

      result.fold((error){
        print(error);
        emit(ButtonFailureState(errorMessage: error.toString()));
      }, (data){
        emit(ButtonSuccessState());
      });
    }catch(e){
      print(e);

      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }

}