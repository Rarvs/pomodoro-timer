import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro.dart';
import 'package:pomodoro_timer/models/pomodoro_controller.dart';
import 'package:pomodoro_timer/util/constants.dart';

class PomodoroTimerPage extends StatefulWidget {
  PomodoroTimerPage({required this.pomodoro});

  final Pomodoro pomodoro;

  @override
  _PomodoroTimerPageState createState() => _PomodoroTimerPageState();
}

class _PomodoroTimerPageState extends State<PomodoroTimerPage> {
  CountDownController controller = CountDownController();
  late Pomodoro pomodoro;
  late PomodoroController pomodoroController;
  int sectionTime = 0;
  int section = 0;
  bool isRunning = false;

  void setPomodoroName(newPomodoroName) {
    setState(() {
      pomodoro.name = newPomodoroName;
    });
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pomodoro.name,
          style: kAppBarText,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: InkWell(
              child: Icon(Icons.settings),
              onTap: () => print("Setting pressed"),
            ),
          ),
        ],
      ),
      body: Padding(
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
                        onSubmitted: (value) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      child: Icon(Icons.restart_alt, color: kAccentColor),
                      style: TextButton.styleFrom(
                          backgroundColor: kSecondaryColor,
                          shape: CircleBorder()),
                      onPressed: () {
                        setState((){
                            section = pomodoroController.getFirstPosition();
                            sectionTime = pomodoroController.sections[section] * 60;
                            controller.pause();
                        });
                        print('restart button pressed');
                      }),
                  FloatingActionButton(
                      child: Icon(
                        isRunning ? Icons.pause: Icons.play_arrow,
                        color: kSecondaryColor,
                      ),
                      backgroundColor: kAccentColor,
                      onPressed: () {
                        setState((){
                          isRunning ? controller.pause() : controller.start();
                          isRunning = !isRunning;
                        });
                        print('button pressed');
                      }),
                  // TextButton(
                  //     child: Icon(Icons.stop, color: kAccentColor),
                  //     style: TextButton.styleFrom(
                  //         backgroundColor: kSecondaryColor,
                  //         shape: CircleBorder()),
                  //     onPressed: () {
                  //       setState((){
                  //         controller.pause();
                  //         isRunning = false;
                  //       });
                  //       print('pause button pressed');
                  //     }),
                ],
              )
            ]),
      ),
    );
  }
}