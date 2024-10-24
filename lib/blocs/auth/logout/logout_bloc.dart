import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';

part 'logout_event.dart';
part 'logout_state.dart';

typedef ESST = Either<String, String>;

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRepository repository;

  LogoutBloc(this.repository) : super(LogoutInitialState()) {
    on<LogoutAccountEvent>((event, emit) async {
      emit(LogoutProcessingState());

      final ESST result = await repository.logout();

      result.fold((String l) {
        emit(LogoutErrorState(l));
      }, (String r) {
        emit(LogoutSuccessfulState(r));
      });
    });
  }
}
