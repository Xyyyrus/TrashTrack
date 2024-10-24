// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnouncementImpl _$$AnnouncementImplFromJson(Map<String, dynamic> json) =>
    _$AnnouncementImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      url: json['url'] as String,
      createdAt: const TimestampConverter()
          .fromJson(json['createdAt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnnouncementImplToJson(_$AnnouncementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'url': instance.url,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
