import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro.dart';
import 'package:pomodoro_timer/util/constants.dart';

import 'pomodoro_timer.dart';

class PomodoroListPage extends StatefulWidget {
  static final routeKey = 'pomodoro_page';
  @override
  _PomodoroListPageState createState() => _PomodoroListPageState();
}

class _PomodoroListPageState extends State<PomodoroListPage> {

  List<Pomodoro> pomodoroList = [];

  Pomodoro createPomodoro(){
    Pomodoro newPomodoro = Pomodoro(name: 'New pomodoro',focusTime: 25, longBreakTime: 15, shortBreakTime: 5, sections: 5);
    return newPomodoro;
  }

  late Pomodoro pomodoro;

  @override
  void initState() {
    pomodoro = createPomodoro();
    pomodoroList.add(pomodoro);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
        'Pomodoro Timer',
        style: kAppBarText,
    ),),
      body: Column(
        children: [
          FloatingActionButton(
              child: Icon(
                Icons.add,
                color: kSecondaryColor,
              ),
              backgroundColor: kAccentColor,
              onPressed:(){
                createPomodoro();
                print('button pressed');
              }),
        ],
      ),
    );
  }
}

