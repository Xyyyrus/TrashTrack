import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/blocs/profile/get_profile/get_profile_bloc.dart';
import 'package:trashtrack_user/blocs/schedule/get_schedules/get_schedules_bloc.dart';
import 'package:trashtrack_user/extensions/timestamp_formatter.dart';
import 'package:trashtrack_user/models/profile/profile.dart';
import 'package:trashtrack_user/models/schedule/schedule.dart';
import 'package:trashtrack_user/pages/protected/route/route_page.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting

class SchedulesPage extends StatelessWidget {
  const SchedulesPage({super.key});

  void _gotoRoutePage(BuildContext context, Schedule schedule) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => RoutePage(
          schedule: schedule,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Schedules'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: buildGetProfileBB(),
      ),
    );
  }

  BlocBuilder buildGetProfileBB() {
    return BlocBuilder<GetProfileBloc, GetProfileState>(
      builder: (context, state) {
        if (state is GetProfileSuccessfulState) {
          Profile profile = state.profile;
          String barangay = profile.barangay ?? '';

          BlocProvider.of<GetSchedulesBloc>(context).add(
            GetSchedulesEvent(barangay),
          );

          return buildGetSchedulesBB();
        } else if (state is GetProfileErrorState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(fontSize: 17),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  BlocBuilder buildGetSchedulesBB() {
    return BlocBuilder<GetSchedulesBloc, GetSchedulesState>(
      builder: (context, state) {
        if (state is GetSchedulesSuccessfulState) {
          final List<Schedule> schedules = state.schedules;

          // Get the current day in the desired format (e.g., 'Monday')
          String currentDay = DateFormat('EEEE').format(DateTime.now());

          // Filter schedules to include only those matching the current day
          List<Schedule> filteredSchedules = schedules.where((schedule) {
            return schedule.day ==
                currentDay; // Assuming 'day' is a string like 'Monday'
          }).toList();

          if (filteredSchedules.isNotEmpty) {
            return buildAllSchedulesLB(filteredSchedules);
          } else {
            return const Center(
              child: Text(
                'No active schedules for today',
                style: TextStyle(fontSize: 17),
              ),
            );
          }
        } else if (state is GetSchedulesErrorState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(fontSize: 17),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView buildAllSchedulesLB(List<Schedule> schedules) {
    return ListView.builder(
      itemCount: schedules.length,
      itemBuilder: (BuildContext context, int index) {
        Schedule schedule = schedules[index];

        return Card(
          elevation: 2,
          child: ListTile(
            onTap: () => _gotoRoutePage(context, schedule),
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
