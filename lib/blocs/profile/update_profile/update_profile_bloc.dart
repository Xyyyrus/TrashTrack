import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trashtrack_user/data/repositories/profile_repository.dart';
import 'package:trashtrack_user/models/profile/profile.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

typedef GPBT = Bloc<UpdateProfileEvent, UpdateProfileState>;
typedef ESST = Either<String, String>;

class UpdateProfileBloc extends GPBT {
  final ProfileRepository repository;

  UpdateProfileBloc(this.repository) : super(UpdateProfileInitialState()) {
    on<UpdateProfileEvent>((event, emit) async {
      emit(UpdateProfileProcessingState());

      final ESST result = await repository.updateProfile(event.profile);

      result.fold((String l) {
        emit(UpdateProfileErrorState(l));
      }, (String r) {
        emit(UpdateProfileSuccessfulState(r));
      });
    });
  }
}
