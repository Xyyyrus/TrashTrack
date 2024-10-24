import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/post_repository.dart';
import 'package:trashtrack_user/models/post/post.dart';

part 'get_posts_event.dart';
part 'get_posts_state.dart';

typedef APBT = Bloc<GetPostsEvent, GetPostsState>;

class GetPostsBloc extends APBT {
  final PostRepository postRepository;

  GetPostsBloc(this.postRepository) : super(GetPostsInitialState()) {
    on<GetPostsEvent>((event, emit) async {
      emit(GetPostsProcessingState());

      final result = await postRepository.getPosts();

      result.fold((String l) {
        emit(GetPostsErrorState(l));
      }, (List<Post> r) {
        emit(GetPostsSuccessfulState(r));
      });
    });
  }
}
