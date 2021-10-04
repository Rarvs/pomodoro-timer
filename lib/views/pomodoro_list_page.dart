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
  late PomodoroList pomodoroList;

  Pomodoro createPomodoro() {
    Pomodoro newPomodoro = Pomodoro();
    return newPomodoro;
  }

  late Pomodoro pomodoro;

  @override
  void initState() {
    pomodoro = createPomodoro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pomodoroList = Provider.of<PomodoroList>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: kSecondaryColor,
          ),
          backgroundColor: kAccentColor,
          onPressed: () {
            setState(() {
              pomodoroList.addPomodoro(createPomodoro());
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
        itemCount: pomodoroList.pomodoroList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListenableProvider(
                create: (context) => pomodoroList.pomodoroList[index],
                child: PomodoroTimerPage(),
              ),
            ),
          ),
          child: Consumer(
            builder: (BuildContext context, value, Widget? child) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.timer),
                  title: Text(pomodoroList.pomodoroList[index].task),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
