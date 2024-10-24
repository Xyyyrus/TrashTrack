part of 'report_post_bloc.dart';

@immutable
sealed class ReportPostState {}

class ReportPostInitialState extends ReportPostState {}

class ReportPostProcessingState extends ReportPostState {}

class ReportPostSuccessfulState extends ReportPostState {
  final String message;

  ReportPostSuccessfulState(this.message);
}

class ReportPostErrorState extends ReportPostState {
  final String message;

  ReportPostErrorState(this.message);
}
