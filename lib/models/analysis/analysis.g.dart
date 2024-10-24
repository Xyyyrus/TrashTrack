// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisImpl _$$AnalysisImplFromJson(Map<String, dynamic> json) =>
    _$AnalysisImpl(
      id: json['id'] as String,
      kiloGram: json['kiloGram'] as String,
      cubicMeter: json['cubicMeter'] as String,
      date: const TimestampConverter()
          .fromJson(json['date'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnalysisImplToJson(_$AnalysisImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kiloGram': instance.kiloGram,
      'cubicMeter': instance.cubicMeter,
      'date': const TimestampConverter().toJson(instance.date),
    };
