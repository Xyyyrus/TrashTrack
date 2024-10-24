import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

typedef ESST = Either<String, String>;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitialState()) {
    on<LoginAccountEvent>((event, emit) async {
      emit(LoginProcessingState());

      final ESST result = await repository.login();

      result.fold((String l) {
        emit(LoginErrorState(l));
      }, (String r) {
        emit(LoginSuccessfulState(r));
      });
    });
  }
}
