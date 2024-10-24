// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'route.freezed.dart';
part 'route.g.dart';

@freezed
class Route with _$Route {
  const factory Route({
    required String id,
    @JsonKey(name: 'routeName') required String name,
    required String distance,
    required String duration,
    List<Map<String, dynamic>>? path,
    List<Map<String, dynamic>>? collections,
  }) = _Route;

  factory Route.fromJson(Map<String, Object?> json) => _$RouteFromJson(json);
}
