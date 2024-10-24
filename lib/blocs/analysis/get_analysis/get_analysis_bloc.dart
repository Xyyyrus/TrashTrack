import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/analysis_repository.dart';
import 'package:trashtrack_user/models/analysis/analysis.dart';

part 'get_analysis_event.dart';
part 'get_analysis_state.dart';

typedef GABT = Bloc<GetAnalysisEvent, GetAnalysisState>;

class GetAnalysisBloc extends GABT {
  final AnalysisRepository repository;

  GetAnalysisBloc(this.repository) : super(GetAnalysisInitialState()) {
    on<GetAnalysisEvent>((event, emit) async {
      emit(GetAnalysisProcessingState());

      final result = await repository.getAnalysis();

      result.fold((String l) {
        emit(GetAnalysisErrorState(l));
      }, (List<Analysis> r) {
        emit(GetAnalysisSuccessfulState(r));
      });
    });
  }
}
