part of 'get_analysis_bloc.dart';

@immutable
sealed class GetAnalysisState {}

class GetAnalysisInitialState extends GetAnalysisState {}

class GetAnalysisProcessingState extends GetAnalysisState {}

class GetAnalysisSuccessfulState extends GetAnalysisState {
  final List<Analysis> analysis;

  GetAnalysisSuccessfulState(this.analysis);
}

class GetAnalysisErrorState extends GetAnalysisState {
  final String message;

  GetAnalysisErrorState(this.message);
}
