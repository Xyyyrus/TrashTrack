import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/post_repository.dart';
import 'package:trashtrack_user/models/post/post.dart';

part 'delete_post_event.dart';
part 'delete_post_state.dart';

typedef DPBT = Bloc<DeletePostEvent, DeletePostState>;

class DeletePostBloc extends DPBT {
  final PostRepository postRepository;

  DeletePostBloc(this.postRepository) : super(DeletePostInitialState()) {
    on<DeletePostEvent>((event, emit) async {
      emit(DeletePostProcessingState());

      final result = await postRepository.deletePost(event.post);

      result.fold((String l) {
        emit(DeletePostErrorState(l));
      }, (String r) {
        emit(DeletePostSuccessfulState(r));
      });
    });
  }
}
