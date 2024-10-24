import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/comment_repository.dart';
import 'package:trashtrack_user/models/comment/comment.dart';

part 'delete_comment_event.dart';
part 'delete_comment_state.dart';

typedef DCBT = Bloc<DeleteCommentEvent, DeleteCommentState>;

class DeleteCommentBloc extends DCBT {
  final CommentRepository repository;

  DeleteCommentBloc(this.repository) : super(DeleteCommentInitialState()) {
    on<DeleteCommentEvent>((event, emit) async {
      emit(DeleteCommentProcessingState());

      final result = await repository.deleteComment(event.comment);

      result.fold((String l) {
        emit(DeleteCommentErrorState(l));
      }, (String r) {
        emit(DeleteCommentSuccessfulState(r));
      });
    });
  }
}
