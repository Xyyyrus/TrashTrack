import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trashtrack_user/data/repositories/profile_repository.dart';
import 'package:trashtrack_user/models/profile/profile.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';

typedef GPBT = Bloc<GetProfileEvent, GetProfileState>;
typedef ESPT = Either<String, Profile>;

class GetProfileBloc extends GPBT {
  final ProfileRepository repository;

  GetProfileBloc(this.repository) : super(GetProfileInitialState()) {
    on<GetProfileEvent>((event, emit) async {
      emit(GetProfileProcessingState());

      final ESPT result = await repository.getProfile(event.routeId);

      result.fold((String l) {
        emit(GetProfileErrorState(l));
      }, (Profile r) {
        emit(GetProfileSuccessfulState(r));
      });
    });
  }
}
