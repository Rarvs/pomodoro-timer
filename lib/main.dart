import 'package:flutter/material.dart';
import 'package:pomodoro_timer/util/constants.dart';
import 'package:pomodoro_timer/views/home_screen.dart';
import 'package:pomodoro_timer/views/pomodoro_list_page.dart';

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
      home: HomeScreen(),
    );
  }
}
