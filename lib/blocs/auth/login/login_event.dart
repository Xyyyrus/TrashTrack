part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginAccountEvent extends LoginEvent {}
