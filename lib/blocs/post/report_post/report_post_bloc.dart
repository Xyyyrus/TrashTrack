import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/post_repository.dart';
import 'package:trashtrack_user/models/report/report.dart';

part 'report_post_event.dart';
part 'report_post_state.dart';

typedef RPBT = Bloc<ReportPostEvent, ReportPostState>;

class ReportPostBloc extends RPBT {
  final PostRepository postRepository;

  ReportPostBloc(this.postRepository) : super(ReportPostInitialState()) {
    on<ReportPostEvent>((event, emit) async {
      emit(ReportPostProcessingState());

      final result = await postRepository.reportPost(event.report);

      result.fold((String l) {
        emit(ReportPostErrorState(l));
      }, (String r) {
        emit(ReportPostSuccessfulState(r));
      });
    });
  }
}
