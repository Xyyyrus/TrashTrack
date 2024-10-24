part of 'delete_post_bloc.dart';

@immutable
sealed class DeletePostState {}

class DeletePostInitialState extends DeletePostState {}

class DeletePostProcessingState extends DeletePostState {}

class DeletePostSuccessfulState extends DeletePostState {
  final String message;

  DeletePostSuccessfulState(this.message);
}

class DeletePostErrorState extends DeletePostState {
  final String message;

  DeletePostErrorState(this.message);
}
