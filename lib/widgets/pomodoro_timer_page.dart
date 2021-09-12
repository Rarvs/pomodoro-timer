import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro.dart';
import 'package:pomodoro_timer/util/constants.dart';

import 'pomodoro_timer.dart';

class PomodoroTimerPage extends StatefulWidget {
  static final routeKey = 'pomodoro_page';
  @override
  _PomodoroTimerPageState createState() => _PomodoroTimerPageState();
}

class _PomodoroTimerPageState extends State<PomodoroTimerPage> {
  int pomodoroFocusTime = 25;
  int pomodoroLongBreakTime = 15;
  int pomodoroShortBreakTime = 5;
  int pomodoroSections = 5;
  String pomodoroName = 'New pomodoro';

  late Pomodoro pomodoro;

  @override
  void initState() {
    pomodoro = Pomodoro(
        focusTime: pomodoroFocusTime,
        longBreakTime: pomodoroLongBreakTime,
        shortBreakTime: pomodoroShortBreakTime,
        sections: pomodoroSections,
        name: pomodoroName);
    super.initState();
  }

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
              onTap: () => print("Setting pressed"),
            ),
          ),
        ],
      ),
      body: PomodoroTimer(pomodoro: pomodoro),
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
