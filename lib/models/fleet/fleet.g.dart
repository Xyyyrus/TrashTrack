// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FleetImpl _$$FleetImplFromJson(Map<String, dynamic> json) => _$FleetImpl(
      id: json['id'] as String,
      truckName: json['truckName'] as String,
      truckPlate: json['truckPlate'] as String,
      truckType: json['truckType'] as String,
      status: json['status'] as String,
      location: json['location'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$FleetImplToJson(_$FleetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'truckName': instance.truckName,
      'truckPlate': instance.truckPlate,
      'truckType': instance.truckType,
      'status': instance.status,
      'location': instance.location,
    };
