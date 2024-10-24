import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trashtrack_user/converters/file_converter.dart';
import 'package:trashtrack_user/converters/timestamp_converter.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    String? uid,
    required String title,
    required String body,
    @FileConverter() File? image,
    @TimestampConverter() Timestamp? createdAt,
    String? url,
    String? author,
    int? commentsCount,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}
