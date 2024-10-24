import 'package:intl/intl.dart';

extension DatetimeFormatter on DateTime {
  String toFormattedDay() {
    return DateFormat('EEEE').format(this);
  }
}
