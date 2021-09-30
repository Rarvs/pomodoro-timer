import 'package:flutter/material.dart';

class Pomodoro extends ChangeNotifier {
  String task = 'New Timer';
  int focusTime = 25;
  int sections = 4;
  int shortBreakTime = 5;
  int longBreakTime = 15;

  Pomodoro(
      {this.focusTime = 25,
      this.sections = 4,
      this.longBreakTime = 15,
      this.shortBreakTime = 5,
      this.task = 'New Pomodoro'});

  void setName(String newName) {
    task = newName;
    notifyListeners();
  }

  void setFocusTime(int newFocusTime) {
    focusTime = newFocusTime;
    notifyListeners();
  }

  void setLongBreakTime(int newLongBreakTime) {
    longBreakTime = newLongBreakTime;
    notifyListeners();
  }

  void setShortBreakTime(int newShortBreakTime) {
    shortBreakTime = newShortBreakTime;
    notifyListeners();
  }

  void setSections(int newSections) {
    sections = newSections;
    notifyListeners();
  }
}
