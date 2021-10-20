import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro.dart';
import 'package:pomodoro_timer/models/pomodoro_list.dart';
import 'package:pomodoro_timer/util/constants.dart';
import 'package:pomodoro_timer/views/pomodoro_timer_page.dart';
import 'package:provider/provider.dart';

class PomodoroListPage extends StatefulWidget {
  static final routeKey = 'pomodoro_page';
  @override
  _PomodoroListPageState createState() => _PomodoroListPageState();
}

class _PomodoroListPageState extends State<PomodoroListPage> {
  late PomodoroList myPomodoros;

  Pomodoro createPomodoro() {
    Pomodoro newPomodoro = Pomodoro();
    return newPomodoro;
  }

  Future<void> _removeDialog(int pomodoroIndex) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Remove pomodoro?',
              style: kAppBarText,
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      'Would you like to remove ${myPomodoros.pomodoroList[pomodoroIndex].task}'),
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
                  myPomodoros
                      .removePomodoro(myPomodoros.pomodoroList[pomodoroIndex]);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  late Pomodoro pomodoro;

  @override
  void initState() {
    pomodoro = createPomodoro();
    super.initState();
  }

  Future<void> _rebuildOnReturn() async {
    setState(() {
      myPomodoros;
    });
  }

  @override
  Widget build(BuildContext context) {
    myPomodoros = Provider.of<PomodoroList>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: kSecondaryColor,
          ),
          backgroundColor: kAccentColor,
          onPressed: () {
            setState(() {
              myPomodoros.addPomodoro(createPomodoro());
            });
            print('button pressed');
          }),
      appBar: AppBar(
        title: Text(
          'Pomodoro Timers List',
          style: kAppBarText,
        ),
      ),
      body: ListView.builder(
        itemCount: myPomodoros.pomodoroList.length,
        itemBuilder: (context, index) => InkWell(
          onLongPress: () =>
              myPomodoros.removePomodoro(myPomodoros.pomodoroList[index]),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListenableProvider(
                create: (context) => myPomodoros.pomodoroList[index],
                child: PomodoroTimerPage(),
              ),
            ),
          ).then((value) => _rebuildOnReturn()),
          child: Consumer(
            builder: (BuildContext context, value, Widget? child) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.timer),
                  trailing: InkWell(
                    child: Icon(Icons.delete),
                    onTap: () => _removeDialog(index),
                    // pomodoroList.removePomodoro(pomodoroList.pomodoroList[index]),
                  ),
                  title: Text(myPomodoros.pomodoroList[index].task),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
