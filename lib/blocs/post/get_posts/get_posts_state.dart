part of 'get_posts_bloc.dart';

@immutable
sealed class GetPostsState {}

class GetPostsInitialState extends GetPostsState {}

class GetPostsProcessingState extends GetPostsState {}

class GetPostsSuccessfulState extends GetPostsState {
  final List<Post> posts;

  GetPostsSuccessfulState(this.posts);
}

class GetPostsErrorState extends GetPostsState {
  final String message;

  GetPostsErrorState(this.message);
}
