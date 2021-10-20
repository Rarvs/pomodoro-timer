import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro.dart';

class PomodoroList extends ChangeNotifier {
  List<Pomodoro> pomodoroList = [];

  void addPomodoro(Pomodoro newPomodoro) {
    pomodoroList.add(newPomodoro);
    notifyListeners();
  }

  void removePomodoro(Pomodoro pomodoro) {
    pomodoroList.remove(pomodoro);
    notifyListeners();
  }
}
