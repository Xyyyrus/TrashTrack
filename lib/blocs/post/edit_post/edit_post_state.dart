part of 'edit_post_bloc.dart';

@immutable
sealed class EditPostState {}

class EditPostInitialState extends EditPostState {}

class EditPostProcessingState extends EditPostState {}

class EditPostSuccessfulState extends EditPostState {
  final String message;

  EditPostSuccessfulState(this.message);
}

class EditPostErrorState extends EditPostState {
  final String message;

  EditPostErrorState(this.message);
}
