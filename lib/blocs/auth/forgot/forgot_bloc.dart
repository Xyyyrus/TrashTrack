import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trashtrack_user/data/repositories/auth_repository.dart';
import 'package:trashtrack_user/models/credential/credential.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';

typedef ESST = Either<String, String>;

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  final AuthRepository repository;

  ForgotBloc(this.repository) : super(ForgotInitialState()) {
    on<ForgotAccountEvent>((event, emit) async {
      emit(ForgotProcessingState());

      final ESST result = await repository.forgot(event.credential);

      result.fold((String l) {
        emit(ForgotErrorState(l));
      }, (String r) {
        emit(ForgotSuccessfulState(r));
      });
    });
  }
}
