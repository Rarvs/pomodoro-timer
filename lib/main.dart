import 'package:flutter/material.dart';
import 'package:pomodoro_timer/util/constants.dart';
import 'package:pomodoro_timer/widgets/pomodoro_timer_page.dart';

void main() {
  runApp(PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PomodoroApp',
      theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor,
          scaffoldBackgroundColor: kPrimaryColor),
      initialRoute: PomodoroTimerPage.routeKey,
      routes: {
        PomodoroTimerPage.routeKey: (context) => PomodoroTimerPage(),
      },
    );
  }
}
