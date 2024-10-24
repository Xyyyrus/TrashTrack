part of 'update_profile_bloc.dart';

@immutable
sealed class UpdateProfileState {}

class UpdateProfileInitialState extends UpdateProfileState {}

class UpdateProfileProcessingState extends UpdateProfileState {}

class UpdateProfileSuccessfulState extends UpdateProfileState {
  final String message;

  UpdateProfileSuccessfulState(this.message);
}

class UpdateProfileErrorState extends UpdateProfileState {
  final String message;

  UpdateProfileErrorState(this.message);
}
