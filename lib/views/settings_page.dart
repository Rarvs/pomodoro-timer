import 'package:flutter/material.dart';
import 'package:pomodoro_timer/util/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
          children: [FocusTimeSetting()],
        ),
      ),
    );
  }
}

class FocusTimeSetting extends StatelessWidget {
  const FocusTimeSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Focus Time',
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
              '25',
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
