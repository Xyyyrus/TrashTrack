part of 'add_post_bloc.dart';

@immutable
sealed class AddPostState {}

class AddPostInitialState extends AddPostState {}

class AddPostProcessingState extends AddPostState {}

class AddPostSuccessfulState extends AddPostState {
  final String message;

  AddPostSuccessfulState(this.message);
}

class AddPostErrorState extends AddPostState {
  final String message;

  AddPostErrorState(this.message);
}
