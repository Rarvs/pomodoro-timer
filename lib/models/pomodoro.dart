class Pomodoro {
  String name = 'New Timer';
  String task = 'New Task';
  int focusTime = 25;
  int sections = 4;
  int shortBreakTime = 5;
  int longBreakTime = 15;

  Pomodoro(
      {required this.focusTime,
      required this.sections,
      required this.longBreakTime,
      required this.shortBreakTime,
      required this.name});

  static Pomodoro defaultPomodoro = Pomodoro(focusTime: 1, sections: 4, longBreakTime: 1, shortBreakTime: 2, name: 'New Pomodoro');


}


