import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/data/repositories/schedule_repository.dart';
import 'package:trashtrack_user/models/schedule/schedule.dart';

part 'get_schedules_event.dart';
part 'get_schedules_state.dart';

typedef GSBT = Bloc<GetSchedulesEvent, GetSchedulesState>;

class GetSchedulesBloc extends GSBT {
  final ScheduleRepository repository;

  GetSchedulesBloc(this.repository) : super(GetSchedulesInitialState()) {
    on<GetSchedulesEvent>((event, emit) async {
      emit(GetSchedulesProcessingState());

      final result = await repository.getSchedules(event.routeId);

      result.fold((String l) {
        emit(GetSchedulesErrorState(l));
      }, (List<Schedule> r) {
        emit(GetSchedulesSuccessfulState(r));
      });
    });
  }
}
