part of 'edit_comment_bloc.dart';

@immutable
sealed class EditCommentState {}

class EditCommentInitialState extends EditCommentState {}

class EditCommentProcessingState extends EditCommentState {}

class EditCommentSuccessfulState extends EditCommentState {
  final String message;

  EditCommentSuccessfulState(this.message);
}

class EditCommentErrorState extends EditCommentState {
  final String message;

  EditCommentErrorState(this.message);
}
