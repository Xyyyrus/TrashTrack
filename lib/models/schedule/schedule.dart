import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trashtrack_user/converters/timestamp_converter.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    required String id,
    required String routeId,
    required String fleetId,
    required String driverId,
    required String day,
    @TimestampConverter() required Timestamp time,
    String? routeName,
    List<Map<String, dynamic>>? routePath,
    List<Map<String, dynamic>>? collectionsPath,
    String? fleetStatus,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, Object?> json) =>
      _$ScheduleFromJson(json);
}
