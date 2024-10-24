part of 'forgot_bloc.dart';

@immutable
sealed class ForgotState {}

class ForgotInitialState extends ForgotState {}

class ForgotProcessingState extends ForgotState {}

class ForgotSuccessfulState extends ForgotState {
  final String message;

  ForgotSuccessfulState(this.message);
}

class ForgotErrorState extends ForgotState {
  final String message;

  ForgotErrorState(this.message);
}
