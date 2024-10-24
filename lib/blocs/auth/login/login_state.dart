part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitialState extends LoginState {}

class LoginProcessingState extends LoginState {}

class LoginSuccessfulState extends LoginState {
  final String message;

  LoginSuccessfulState(this.message);
}

class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState(this.message);
}
