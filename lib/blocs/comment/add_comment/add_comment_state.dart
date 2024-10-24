part of 'add_comment_bloc.dart';

@immutable
sealed class AddCommentState {}

class AddCommentInitialState extends AddCommentState {}

class AddCommentProcessingState extends AddCommentState {}

class AddCommentSuccessfulState extends AddCommentState {
  final String message;

  AddCommentSuccessfulState(this.message);
}

class AddCommentErrorState extends AddCommentState {
  final String message;

  AddCommentErrorState(this.message);
}
