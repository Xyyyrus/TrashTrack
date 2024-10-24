import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Notification Settings',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Manage notification preference'),
                      ],
                    ),
                    CustomSwitch(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  Future<void> _switchNotif(bool value, SharedPreferences? sharedPref) async {
    await sharedPref?.setBool('notifAllowed', value);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (
        BuildContext context,
        AsyncSnapshot<SharedPreferences> snapshot,
      ) {
        if (snapshot.hasData) {
          SharedPreferences? sharedPref = snapshot.data;
          bool? notifAllowed = sharedPref?.getBool('notifAllowed');

          return Switch(
            value: notifAllowed ?? false,
            onChanged: (value) => _switchNotif(value, sharedPref),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
