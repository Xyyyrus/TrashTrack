import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/comment_repository.dart';
import 'package:trashtrack_user/models/comment/comment.dart';

part 'edit_comment_event.dart';
part 'edit_comment_state.dart';

typedef ECBT = Bloc<EditCommentEvent, EditCommentState>;

class EditCommentBloc extends ECBT {
  final CommentRepository repository;

  EditCommentBloc(this.repository) : super(EditCommentInitialState()) {
    on<EditCommentEvent>((event, emit) async {
      emit(EditCommentProcessingState());

      final result = await repository.editComment(event.comment);

      result.fold((String l) {
        emit(EditCommentErrorState(l));
      }, (String r) {
        emit(EditCommentSuccessfulState(r));
      });
    });
  }
}
