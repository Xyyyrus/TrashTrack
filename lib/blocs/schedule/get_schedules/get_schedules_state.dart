part of 'get_schedules_bloc.dart';

@immutable
sealed class GetSchedulesState {}

class GetSchedulesInitialState extends GetSchedulesState {}

class GetSchedulesProcessingState extends GetSchedulesState {}

class GetSchedulesSuccessfulState extends GetSchedulesState {
  final List<Schedule> schedules;

  GetSchedulesSuccessfulState(this.schedules);
}

class GetSchedulesErrorState extends GetSchedulesState {
  final String message;

  GetSchedulesErrorState(this.message);
}
