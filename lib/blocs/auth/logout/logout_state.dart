part of 'logout_bloc.dart';

@immutable
sealed class LogoutState {}

class LogoutInitialState extends LogoutState {}

class LogoutProcessingState extends LogoutState {}

class LogoutSuccessfulState extends LogoutState {
  final String message;

  LogoutSuccessfulState(this.message);
}

class LogoutErrorState extends LogoutState {
  final String message;

  LogoutErrorState(this.message);
}
