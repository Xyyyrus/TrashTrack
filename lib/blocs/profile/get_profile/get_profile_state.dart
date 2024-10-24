part of 'get_profile_bloc.dart';

@immutable
sealed class GetProfileState {}

class GetProfileInitialState extends GetProfileState {}

class GetProfileProcessingState extends GetProfileState {}

class GetProfileSuccessfulState extends GetProfileState {
  final Profile profile;

  GetProfileSuccessfulState(this.profile);
}

class GetProfileErrorState extends GetProfileState {
  final String message;

  GetProfileErrorState(this.message);
}
