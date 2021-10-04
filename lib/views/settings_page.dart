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
    pomodoro = Provider.of<Pomodoro>(context);
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
              onDecrease: () => pomodoro.setFocusTime(--pomodoro.focusTime),
              onIncrease: () => pomodoro.setFocusTime(++pomodoro.focusTime),
              label: 'Focus Time',
            ),
            PomodoroSettingItem(
              value: pomodoro.shortBreakTime,
              onDecrease: () =>
                  pomodoro.setShortBreakTime(--pomodoro.shortBreakTime),
              onIncrease: () =>
                  pomodoro.setShortBreakTime(++pomodoro.shortBreakTime),
              label: 'Short break Time',
            ),
            PomodoroSettingItem(
              value: pomodoro.longBreakTime,
              onDecrease: () =>
                  pomodoro.setLongBreakTime(--pomodoro.longBreakTime),
              onIncrease: () =>
                  pomodoro.setLongBreakTime(++pomodoro.longBreakTime),
              label: 'Long break time',
            ),
            PomodoroSettingItem(
              value: pomodoro.sections,
              onDecrease: () => pomodoro.setSections(--pomodoro.sections),
              onIncrease: () => pomodoro.setSections(++pomodoro.sections),
              label: 'Sections',
            )
          ],
        ),
      ),
    );
  }
}

class PomodoroSettingItem extends StatelessWidget {
  PomodoroSettingItem(
      {required this.value,
      required this.label,
      required this.onIncrease,
      required this.onDecrease});
  final String label;
  final int value;
  final Function onIncrease;
  final Function onDecrease;

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            TextButton(
              child: Icon(Icons.remove, color: kTextColor),
              style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor, shape: CircleBorder()),
              onPressed: () => value > 1 ? onDecrease() : null,
            ),
            Text(
              value.toString(),
              style: TextStyle(fontSize: 32.0),
            ),
            TextButton(
              child: Icon(Icons.add, color: kTextColor),
              style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor, shape: CircleBorder()),
              onPressed: () => value < 100 ? onIncrease() : null,
            ),
          ],
        )
      ],
    );
  }
}
