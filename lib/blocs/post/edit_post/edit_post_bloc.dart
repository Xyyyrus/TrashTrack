import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/post_repository.dart';
import 'package:trashtrack_user/models/post/post.dart';

part 'edit_post_event.dart';
part 'edit_post_state.dart';

typedef EPBT = Bloc<EditPostEvent, EditPostState>;

class EditPostBloc extends EPBT {
  final PostRepository postRepository;

  EditPostBloc(this.postRepository) : super(EditPostInitialState()) {
    on<EditPostEvent>((event, emit) async {
      emit(EditPostProcessingState());

      final result = await postRepository.editPost(event.post);

      result.fold((String l) {
        emit(EditPostErrorState(l));
      }, (String r) {
        emit(EditPostSuccessfulState(r));
      });
    });
  }
}
