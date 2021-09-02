import 'package:flutter/material.dart';
import 'package:pomodoro_timer/util/constants.dart';
import 'package:pomodoro_timer/views/settings_page.dart';

import 'pomodoro_timer.dart';

String pomodoroName = 'New pomodoro';

class PomodoroTimerPage extends StatefulWidget {
  @override
  _PomodoroTimerPageState createState() => _PomodoroTimerPageState();
}

class _PomodoroTimerPageState extends State<PomodoroTimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          pomodoroName,
          style: kAppBarText,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: InkWell(
                child: Icon(Icons.settings),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()))),
          ),
        ],
      ),
      body: PomodoroTimer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kSecondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Active Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Timers List',
          ),
        ],
        selectedItemColor: kAccentColor,
      ),
    );
  }
}
