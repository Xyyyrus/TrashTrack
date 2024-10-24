import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

extension TimestampFormatter on Timestamp {
  String toFormattedDate() {
    DateTime dateTime = toDate();

    DateFormat formatter = DateFormat('MMMM d, yyyy');

    return formatter.format(dateTime);
  }

  String toFormattedTime() {
    DateTime dateTime = toDate();

    DateFormat formatter = DateFormat('hh:mm a');

    return formatter.format(dateTime);
  }
}
