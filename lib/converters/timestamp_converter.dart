import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

typedef JCTMT = JsonConverter<Timestamp, Map<String, dynamic>>;

class TimestampConverter implements JCTMT {
  const TimestampConverter();

  @override
  Timestamp fromJson(Map<String, dynamic> json) {
    final seconds = json['seconds'] as int?;
    final nanoseconds = json['nanoseconds'] as int?;

    if (seconds != null && nanoseconds != null) {
      return Timestamp.fromMicrosecondsSinceEpoch(
        seconds * 1000000 + nanoseconds ~/ 1000,
      );
    }

    throw ArgumentError('Invalid timestamp format');
  }

  @override
  Map<String, dynamic> toJson(Timestamp object) {
    return {
      'seconds': object.seconds,
      'nanoseconds': object.nanoseconds,
    };
  }
}
