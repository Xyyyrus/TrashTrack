part of 'delete_comment_bloc.dart';

@immutable
sealed class DeleteCommentState {}

class DeleteCommentInitialState extends DeleteCommentState {}

class DeleteCommentProcessingState extends DeleteCommentState {}

class DeleteCommentSuccessfulState extends DeleteCommentState {
  final String message;

  DeleteCommentSuccessfulState(this.message);
}

class DeleteCommentErrorState extends DeleteCommentState {
  final String message;

  DeleteCommentErrorState(this.message);
}
