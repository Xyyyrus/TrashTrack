import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/blocs/profile/get_profile/get_profile_bloc.dart';
import 'package:trashtrack_user/blocs/schedule/get_schedules/get_schedules_bloc.dart';
import 'package:trashtrack_user/extensions/timestamp_formatter.dart';
import 'package:trashtrack_user/models/profile/profile.dart';
import 'package:trashtrack_user/models/schedule/schedule.dart';
import 'package:trashtrack_user/pages/protected/route/route_page.dart';
import 'package:trashtrack_user/pages/protected/schedule/schedules_page.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:trashtrack_user/widgets/custom_elevated_button.dart';

class WeekOfDays extends StatelessWidget {
  const WeekOfDays({super.key});

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
        child: buildGetProfileBB(context),
      ),
    );
  }

  BlocBuilder<GetProfileBloc, GetProfileState> buildGetProfileBB(
      BuildContext context) {
    return BlocBuilder<GetProfileBloc, GetProfileState>(
      builder: (context, state) {
        if (state is GetProfileSuccessfulState) {
          Profile profile = state.profile;
          String barangay = profile.barangay ?? '';

          // Fetch all schedules for the barangay for the week
          BlocProvider.of<GetSchedulesBloc>(context).add(
            GetSchedulesEvent(
              barangay,
            ), // Event should fetch weekly schedules
          );

          return buildGetSchedulesBB(context);
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

  BlocBuilder<GetSchedulesBloc, GetSchedulesState> buildGetSchedulesBB(
      BuildContext context) {
    return BlocBuilder<GetSchedulesBloc, GetSchedulesState>(
      builder: (context, state) {
        if (state is GetSchedulesSuccessfulState) {
          final List<Schedule> schedules = state.schedules;

          // Display the full week schedules
          return buildAllSchedulesLB(schedules, context);
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

  Widget buildAllSchedulesLB(List<Schedule> schedules, BuildContext context) {
    // Days of the week starting from Monday to Sunday
    final List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    // Create a map for the schedule times for the week
    Map<String, List<String>> scheduleMap = {};
    for (var day in daysOfWeek) {
      scheduleMap[day] = []; // Initialize all days with an empty list of times
    }

    // Check if there is an active driver for the current day
    DateTime now = DateTime.now();
    String currentDay =
        now.weekday == 7 ? 'Sunday' : daysOfWeek[now.weekday - 1];
    bool hasActiveDriverToday = false;

    // Populate the schedule map with times for each day
    for (var schedule in schedules) {
      String formattedDay = schedule.day;
      if (scheduleMap.containsKey(formattedDay)) {
        scheduleMap[formattedDay]?.add(
          schedule.time
              .toFormattedTime(), // Assuming toFormattedTime is defined for Timestamp
        );
      }

      // Check for active driver on the current day
      if (formattedDay == currentDay && schedule.fleetStatus == 'active') {
        hasActiveDriverToday = true;
      }
    }

    return Column(
      children: [
        // Schedule table (gray box with two columns for days and times)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[400], // Gray background for the schedule table
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              // Table header (Day, Time)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Day',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Increased font size for header
                      ),
                    ),
                    Text(
                      'Times',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Increased font size for header
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                  color: Colors.black,
                  thickness: 1.5), // Thicker divider for separation
              // Days of the week with times (show "--:--" if no schedule exists for that day)
              Column(
                children: daysOfWeek.map((day) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0), // Increased vertical padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          day,
                          style: const TextStyle(
                            fontSize: 16, // Increased font size for day
                            fontWeight:
                                FontWeight.w600, // Slightly bolder for emphasis
                          ),
                        ),
                        // Display multiple times for each day if they exist
                        Expanded(
                          child: Text(
                            scheduleMap[day]!.isNotEmpty
                                ? scheduleMap[day]!.join(
                                    ', ') // Display times as comma-separated list
                                : '--:--', // Show if no times exist for the day
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 16, // Increased font size for times
                              color: Colors
                                  .black, // Ensure text is clearly visible
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        CustomElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SchedulesPage()),
            );
          },
          labelText: "View Active Routes", // Set the labelText here
        ),
      ],
    );
  }
}
