import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro.dart';
import 'package:pomodoro_timer/models/pomodoro_controller.dart';
import 'package:pomodoro_timer/util/constants.dart';

class PomodoroTimer extends StatefulWidget {
  PomodoroTimer({required this.pomodoro});

  final Pomodoro pomodoro;

  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  CountDownController controller = CountDownController();
  late Pomodoro pomodoro;
  late PomodoroController pomodoroController;
  int sectionTime = 0;
  int section = 0;

  void setPomodoroName(newPomodoroName) {
    setState(() {});
  }

  @override
  void initState() {
    pomodoro = widget.pomodoro;
    pomodoroController = PomodoroController(pomodoro: pomodoro);
    pomodoroController.setSections();
    section = pomodoroController.getFirstPosition();
    sectionTime = pomodoroController.sections[section] * 60;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Container(
                  child: TextField(
                      decoration: kInputTextFieldDecoration,
                      onChanged: (value) {
                        setState(() {
                          setPomodoroName(value);
                        });
                      }),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: kAccentColor,
                shape: BoxShape.circle,
              ),
              child: CircularCountDownTimer(
                controller: controller,
                autoStart: false,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                duration: sectionTime,
                textStyle: kTimerText,
                textFormat: CountdownTextFormat.MM_SS,
                initialDuration: 0,
                isReverse: true,
                isReverseAnimation: true,
                strokeWidth: 20,
                ringColor: kPrimaryColor,
                fillColor: kSecondaryColor,
                onComplete: () {
                  try {
                    section = pomodoroController.getNextSection(section);
                    sectionTime = pomodoroController.sections[section] * 60;
                    controller.restart(duration: sectionTime);
                  } catch (e) {
                    controller.pause();
                    print('Timer ended');
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    child: Icon(Icons.restart_alt, color: kAccentColor),
                    style: TextButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        shape: CircleBorder()),
                    onPressed: () {
                      controller.restart();
                      print('restart button pressed');
                    }),
                FloatingActionButton(
                    child: Icon(
                      Icons.play_arrow,
                      color: kSecondaryColor,
                    ),
                    backgroundColor: kAccentColor,
                    onPressed: () {
                      controller.start();
                      print('button pressed');
                    }),
                TextButton(
                    child: Icon(Icons.stop, color: kAccentColor),
                    style: TextButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        shape: CircleBorder()),
                    onPressed: () {
                      controller.pause();
                      print('pause button pressed');
                    }),
              ],
            )
          ]),
    );
  }
}
