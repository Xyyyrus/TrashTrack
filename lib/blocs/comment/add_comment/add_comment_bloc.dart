import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/comment_repository.dart';
import 'package:trashtrack_user/models/comment/comment.dart';

part 'add_comment_event.dart';
part 'add_comment_state.dart';

typedef ACBT = Bloc<AddCommentEvent, AddCommentState>;

class AddCommentBloc extends ACBT {
  final CommentRepository repository;

  AddCommentBloc(this.repository) : super(AddCommentInitialState()) {
    on<AddCommentEvent>((event, emit) async {
      emit(AddCommentProcessingState());

      final result = await repository.addComment(event.comment);

      result.fold((String l) {
        emit(AddCommentErrorState(l));
      }, (String r) {
        emit(AddCommentSuccessfulState(r));
      });
    });
  }
}
