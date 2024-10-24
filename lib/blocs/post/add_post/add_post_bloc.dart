import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/post_repository.dart';
import 'package:trashtrack_user/models/post/post.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';

typedef APBT = Bloc<AddPostEvent, AddPostState>;

class AddPostBloc extends APBT {
  final PostRepository postRepository;

  AddPostBloc(this.postRepository) : super(AddPostInitialState()) {
    on<AddPostEvent>((event, emit) async {
      emit(AddPostProcessingState());

      final result = await postRepository.addPost(event.post);

      result.fold((String l) {
        emit(AddPostErrorState(l));
      }, (String r) {
        emit(AddPostSuccessfulState(r));
      });
    });
  }
}
