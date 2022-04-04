import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:pomodoro_timer/models/pomodoro.dart';

class PomodoroController extends CountDownController {
  late Pomodoro pomodoro;
  late List<int> sections = [];
  late List<String> sectionsName = [];
  late List<String> sectionsDescription = [];

  PomodoroController({required Pomodoro pomodoro}) {
    this.pomodoro = pomodoro;
  }

  //for each section defined we add a short break and a focus period.
  void startSections() {
    sections.add(pomodoro.focusTime);
    sectionsName.add('Focus');
    sectionsDescription
        .add('Time to take a break and review your accomplishments!');
    for (int i = 1; i < pomodoro.sections; i++) {
      sections.add(pomodoro.shortBreakTime);
      sectionsName.add('Short break');
      sectionsDescription.add('Time to focus again!');
      sections.add(pomodoro.focusTime);
      sectionsName.add('Focus');
      sectionsDescription
          .add('Time to take a break and review your accomplishments!');
    }
    sections.add(pomodoro.longBreakTime);
    sectionsName.add('Long break');
    sectionsDescription.add('Congratulations! You finished your timer');
  }

  int getFirstPosition() {
    return 0;
  }

  int getNextSectionFromCurrent(int position) {
    if (position == sections.length) {
      return getFirstPosition();
    }
    return position + 1;
  }
}
