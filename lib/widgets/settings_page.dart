import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro.dart';
import 'package:pomodoro_timer/util/constants.dart';

class SettingsPage extends StatefulWidget {
  final Pomodoro pomodoro;

  SettingsPage(this.pomodoro);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int focusTime = 25, sections = 4, shortBreakTime = 5, longBreakTime = 15;

  @override
  void initState() {
    focusTime = widget.pomodoro.focusTime;
    sections = widget.pomodoro.sections;
    shortBreakTime = widget.pomodoro.shortBreakTime;
    longBreakTime = widget.pomodoro.longBreakTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: kAppBarText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        child: Column(
          children: [
            FocusTimeSetting(
              value: focusTime,
              label: 'Focus Time',
            )
          ],
        ),
      ),
    );
  }
}

class FocusTimeSetting extends StatelessWidget {
  FocusTimeSetting({required int value, required String label});
  final String label = 'Focus time';
  final int value = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          label,
          style: kAppBarText,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            TextButton(
              child: Icon(Icons.remove, color: kTextColor),
              style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor, shape: CircleBorder()),
              onPressed: () => print('decrease button pressed'),
            ),
            Text(
              value.toString(),
              style: TextStyle(fontSize: 32.0),
            ),
            TextButton(
              child: Icon(Icons.add, color: kTextColor),
              style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor, shape: CircleBorder()),
              onPressed: () => print('increase button pressed'),
            ),
          ],
        )
      ],
    );
  }
}
