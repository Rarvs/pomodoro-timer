import 'package:flutter/material.dart';

class Pomodoro extends ChangeNotifier {
  String name = 'New Timer';
  String task = 'New Task';
  int focusTime = 25;
  int sections = 4;
  int shortBreakTime = 5;
  int longBreakTime = 15;

  Pomodoro(
      {this.focusTime = 25,
      this.sections = 4,
      this.longBreakTime = 15,
      this.shortBreakTime = 5,
      this.name = 'New Pomodoro'});

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setTask(String newTask) {
    task = newTask;
    notifyListeners();
  }

  void setFocusTime(int newFocusTime) {
    focusTime = newFocusTime;
    notifyListeners();
  }

  void setLongBreakTime(int newLongBreakTime) {
    focusTime = newLongBreakTime;
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
