import 'package:flutter/material.dart';

class Pomodoro extends ChangeNotifier{
  String name = 'New Timer';
  int focusTime = 25;
  int sections = 4;
  int shortBreakTime = 5;
  int longBreakTime = 15;

  Pomodoro({focusTime,
      sections,
      longBreakTime,
      shortBreakTime,
      name});

  static Pomodoro defaultPomodoro = Pomodoro(focusTime: 1, sections: 4,longBreakTime: 1,shortBreakTime: 2, name: 'New Pomodoro');

  void changePomodoroName(String newName){
    name = newName;
    notifyListeners();
  }

  void changeFocusTime(int newFocusTime){
    focusTime = newFocusTime;
    notifyListeners();
  }

  void changeSections(int newSections){
    sections = newSections;
    notifyListeners();
  }
  void changeLongBreakTime(int newLongBreakTime){
    longBreakTime = newLongBreakTime;
    notifyListeners();
  }

  void changeShortBreakTime(int newShortBreakTime){
    shortBreakTime = newShortBreakTime;
    notifyListeners();
  }
}


