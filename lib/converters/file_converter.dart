import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

class FileConverter extends JsonConverter<File?, String?> {
  const FileConverter();

  @override
  File? fromJson(String? json) {
    if (json == null) {
      return null;
    }
    return File(json);
  }

  @override
  String? toJson(File? object) {
    if (object == null) {
      return null;
    }
    return object.path;
  }
}
