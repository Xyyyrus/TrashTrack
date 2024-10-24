import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trashtrack_user/converters/timestamp_converter.dart';

part 'analysis.freezed.dart';
part 'analysis.g.dart';

@freezed
class Analysis with _$Analysis {
  const factory Analysis({
    required String id,
    required String kiloGram,
    required String cubicMeter,
    @TimestampConverter() required Timestamp date,
  }) = _Analysis;

  factory Analysis.fromJson(Map<String, Object?> json) =>
      _$AnalysisFromJson(json);
}
