// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      uid: json['uid'] as String?,
      title: json['title'] as String,
      body: json['body'] as String,
      image: const FileConverter().fromJson(json['image'] as String?),
      createdAt: _$JsonConverterFromJson<Map<String, dynamic>, Timestamp>(
          json['createdAt'], const TimestampConverter().fromJson),
      url: json['url'] as String?,
      author: json['author'] as String?,
      commentsCount: (json['commentsCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'title': instance.title,
      'body': instance.body,
      'image': const FileConverter().toJson(instance.image),
      'createdAt': _$JsonConverterToJson<Map<String, dynamic>, Timestamp>(
          instance.createdAt, const TimestampConverter().toJson),
      'url': instance.url,
      'author': instance.author,
      'commentsCount': instance.commentsCount,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
