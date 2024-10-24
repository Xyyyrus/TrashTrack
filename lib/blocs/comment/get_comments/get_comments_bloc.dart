import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/comment_repository.dart';
import 'package:trashtrack_user/models/comment/comment.dart';
import 'package:trashtrack_user/models/post/post.dart';

part 'get_comments_event.dart';
part 'get_comments_state.dart';

typedef GCBT = Bloc<GetCommentsEvent, GetCommentsState>;

class GetCommentsBloc extends GCBT {
  final CommentRepository repository;

  GetCommentsBloc(this.repository) : super(GetCommentsInitialState()) {
    on<GetCommentsEvent>((event, emit) async {
      emit(GetCommentsProcessingState());

      final result = await repository.getComments(event.post);

      result.fold((String l) {
        emit(GetCommentsErrorState(l));
      }, (List<Comment> r) {
        emit(GetCommentsSuccessfulState(r));
      });
    });
  }
}
