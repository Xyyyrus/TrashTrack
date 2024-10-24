import 'package:flutter/material.dart';
import 'package:trashtrack_user/models/schedule/schedule.dart';
import 'package:trashtrack_user/extensions/timestamp_formatter.dart';

class ScheduleListView extends StatelessWidget {
  final List<Schedule> schedules;
  final Function(Schedule) onTap;

  const ScheduleListView({
    Key? key,
    required this.schedules,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: schedules.length,
      itemBuilder: (BuildContext context, int index) {
        Schedule schedule = schedules[index];

        return Card(
          elevation: 2,
          child: ListTile(
            onTap: () => onTap(schedule),
            title: Text(
              schedule.time.toFormattedTime(),
              style: const TextStyle(fontSize: 17),
            ),
          ),
        );
      },
    );
  }
}
