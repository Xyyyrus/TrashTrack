import 'package:freezed_annotation/freezed_annotation.dart';

part 'fleet.freezed.dart';
part 'fleet.g.dart';

@freezed
class Fleet with _$Fleet {
  const factory Fleet({
    required String id,
    required String truckName,
    required String truckPlate,
    required String truckType,
    required String status,
    required Map<String, dynamic> location,
  }) = _Fleet;

  factory Fleet.fromJson(Map<String, Object?> json) => _$FleetFromJson(json);
}
