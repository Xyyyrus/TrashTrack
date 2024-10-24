import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trashtrack_user/blocs/profile/get_profile/get_profile_bloc.dart';
import 'package:trashtrack_user/blocs/schedule/get_schedules/get_schedules_bloc.dart';
import 'package:trashtrack_user/models/profile/profile.dart';
import 'package:trashtrack_user/models/schedule/schedule.dart';
import 'package:trashtrack_user/pages/protected/route/route_page.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:trashtrack_user/widgets/schedule_listview.dart';

class SchedulesPage extends StatelessWidget {
  const SchedulesPage({super.key});

  void _gotoRoutePage(BuildContext context, Schedule schedule) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => RoutePage(schedule: schedule),
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

          return ScheduleListView(
            schedules: schedules,
            onTap: (schedule) => _gotoRoutePage(context, schedule),
          );
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
}
