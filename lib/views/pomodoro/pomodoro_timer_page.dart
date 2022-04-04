import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro.dart';
import 'package:pomodoro_timer/models/pomodoro_controller.dart';
import 'package:pomodoro_timer/services/notification/notification_services.dart';
import 'package:pomodoro_timer/util/constants.dart';
import 'package:pomodoro_timer/views/pomodoro/settings_page.dart';
import 'package:provider/provider.dart';

class PomodoroTimerPage extends StatefulWidget {
  @override
  _PomodoroTimerPageState createState() => _PomodoroTimerPageState();
}

class _PomodoroTimerPageState extends State<PomodoroTimerPage> {
  var notificationHelper;
  CountDownController controller = CountDownController();
  late Pomodoro pomodoro;
  late PomodoroController pomodoroController;
  int sectionTime = 0;
  int section = 0;
  bool isRunning = false;

  @override
  void initState() {
    notificationHelper = NotificationHelper();
    notificationHelper.initializeNotification();
    super.initState();
  }

  void _createController() {
    pomodoroController = PomodoroController(pomodoro: pomodoro);
    pomodoroController.startSections();
    section = pomodoroController.getFirstPosition();
    sectionTime = pomodoroController.sections[section] * 60;
  }

  void _rebuildIfChanged() {
    setState(() {
      isRunning = true;
    });
    controller.restart(duration: sectionTime);
  }

  Future<void> _confirmationDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Restart pomodoro?',
              style: kAppBarText,
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      'If you decline, your settings changes will take effect after the current section ends or if you manually restart the timer.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'No',
                  style: kAppText,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text(
                  'Yes',
                  style: kAppText,
                ),
                onPressed: () {
                  _rebuildIfChanged();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _getNextSection() {
    try {
      section = pomodoroController.getNextSectionFromCurrent(section);
      sectionTime = pomodoroController.sections[section] * 60;
      controller.restart(duration: sectionTime);
    } catch (e) {
      controller.pause();
      print(e);
      print('Timer ended');
    }
  }

  void _showNotification() {
    notificationHelper.displayNotification(
        title: '${pomodoro.task}',
        body: '${pomodoroController.sectionsName[section]} has ended\n'
            '${pomodoroController.sectionsDescription[section]}');
    print(
        '${pomodoroController.sectionsName[section]} has ended \n ${pomodoroController.sectionsDescription[section]}');
  }

  void _sectionCompleted() {
    //TODO: Create a local notification with the task, section e duration of next section. Maybe add a motivational quote.
    _showNotification();
    _getNextSection();
  }

  @override
  Widget build(BuildContext context) {
    pomodoro = Provider.of<Pomodoro>(context);
    _createController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pomodoro.task,
          style: kAppBarText,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: InkWell(
              child: Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListenableProvider(
                        create: (context) => pomodoro, child: SettingsPage()),
                  ),
                ).then((value) => _confirmationDialog());
                print("Setting pressed");
              },
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
                    onSubmitted: (value) => pomodoro.setName(value),
                  ),
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
                onComplete: () => _sectionCompleted(),
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
                      setState(() {
                        section = pomodoroController.getFirstPosition();
                        sectionTime = pomodoroController.sections[section] * 60;
                        controller.restart(duration: sectionTime);
                        isRunning = true;
                      });
                      print('restart button pressed');
                    }),
                FloatingActionButton(
                  child: Icon(
                    isRunning ? Icons.pause : Icons.play_arrow,
                    color: kSecondaryColor,
                  ),
                  backgroundColor: kAccentColor,
                  onPressed: () {
                    setState(() {
                      isRunning ? controller.pause() : controller.start();
                      isRunning = !isRunning;
                    });
                    print('button pressed');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
