part of 'forgot_bloc.dart';

@immutable
sealed class ForgotEvent {}

class ForgotAccountEvent extends ForgotEvent {
  final Credential credential;

  ForgotAccountEvent(this.credential);
}
