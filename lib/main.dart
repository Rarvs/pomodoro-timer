import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro_list.dart';
import 'package:pomodoro_timer/util/constants.dart';
import 'package:pomodoro_timer/views/pomodoro/pomodoro_list_page.dart';
import 'package:provider/provider.dart';

void printHello() {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  print("${now} Hello, world! isolate=${isolateId}, function = '$printHello'");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(PomodoroApp());
  final int helloAlarmId = 0;
  await AndroidAlarmManager.oneShot(
      Duration(seconds: 10), helloAlarmId, printHello);
}

class PomodoroApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PomodoroApp',
      theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: kPrimaryColor),
      home: ListenableProvider(
        create: (context) => PomodoroList(),
        child: PomodoroListPage(),
      ),
    );
  }
}
