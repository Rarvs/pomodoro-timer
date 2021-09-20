import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro.dart';
import 'package:pomodoro_timer/util/constants.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Pomodoro pomodoro;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pomodoro = context.watch<Pomodoro>();
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
            PomodoroSettingItem(
              value: pomodoro.focusTime,
              label: 'Focus Time',
            ),
            PomodoroSettingItem(
              value: pomodoro.shortBreakTime,
              label: 'Short break Time',
            ),
            PomodoroSettingItem(
              value: pomodoro.longBreakTime,
              label: 'Long break time',
            ),
            PomodoroSettingItem(
              value: pomodoro.sections,
              label: 'Sections',
            )
          ],
        ),
      ),
    );
  }
}

class PomodoroSettingItem extends StatelessWidget {
  PomodoroSettingItem({required this.value, required this.label});
  final String label;
  final int value;

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
              onPressed: () {
                print('decrease button pressed');
              }
            ),
            Text(
              value.toString(),
              style: TextStyle(fontSize: 32.0),
            ),
            TextButton(
              child: Icon(Icons.add, color: kTextColor),
              style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor, shape: CircleBorder()),
              onPressed: () => {
                print('increase button pressed')
                },
            ),
          ],
        )
      ],
    );
  }

}
