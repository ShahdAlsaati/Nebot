import 'package:equatable/equatable.dart';

abstract class ButtonState extends Equatable {
  const ButtonState();

  @override
  List<Object> get props => [];
}

class ButtonInitialState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

class ButtonSuccessState extends ButtonState {}

class ButtonFailureState extends ButtonState {
  final String errorMessage;

  const ButtonFailureState({required this.errorMessage});

}
