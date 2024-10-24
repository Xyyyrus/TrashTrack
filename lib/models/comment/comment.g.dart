// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String?,
      postId: json['postId'] as String?,
      uid: json['uid'] as String?,
      comment: json['comment'] as String?,
      author: json['author'] as String?,
      createdAt: _$JsonConverterFromJson<Map<String, dynamic>, Timestamp>(
          json['createdAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'uid': instance.uid,
      'comment': instance.comment,
      'author': instance.author,
      'createdAt': _$JsonConverterToJson<Map<String, dynamic>, Timestamp>(
          instance.createdAt, const TimestampConverter().toJson),
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
