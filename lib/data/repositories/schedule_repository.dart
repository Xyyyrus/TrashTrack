import 'package:dartz/dartz.dart';
import 'package:trashtrack_user/data/sources/schedule/get_schedules_source.dart';
import 'package:trashtrack_user/models/schedule/schedule.dart';

typedef FESLT = Future<Either<String, List<Schedule>>>;

class ScheduleRepository {
  GetSchedulesSource getSchedulesSource;

  ScheduleRepository({
    required this.getSchedulesSource,
  });

  FESLT getSchedules(String routeId) async {
    return await getSchedulesSource.getSchedules(routeId);
  }
}
