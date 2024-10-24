part of 'get_comments_bloc.dart';

@immutable
sealed class GetCommentsState {}

class GetCommentsInitialState extends GetCommentsState {}

class GetCommentsProcessingState extends GetCommentsState {}

class GetCommentsSuccessfulState extends GetCommentsState {
  final List<Comment> comments;

  GetCommentsSuccessfulState(this.comments);
}

class GetCommentsErrorState extends GetCommentsState {
  final String message;

  GetCommentsErrorState(this.message);
}
