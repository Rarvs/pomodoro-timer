import 'package:pomodoro_timer/models/pomodoro.dart';

class PomodoroController {
  late Pomodoro pomodoro;
  late List<int> sections = [];

  PomodoroController({required Pomodoro pomodoro}) {
    this.pomodoro = pomodoro;
  }

  void setSections() {
    sections.add(pomodoro.focusTime);
    for (int i = 1; i < pomodoro.breakQuantity; i++) {
      sections.add(pomodoro.shortBreakTime);
      sections.add(pomodoro.focusTime);
    }
    sections.add(pomodoro.longBreakTime);
  }

  int getFirstPosition() {
    return 0;
  }

  int getNextSection(int position) {
    if (position == sections.length) {
      return getFirstPosition();
    }
    return position + 1;
  }
}
