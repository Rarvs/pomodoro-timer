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
    Pomodoro newPomodoro = Pomodoro(
        name: 'New pomodoro',
        focusTime: 25,
        longBreakTime: 15,
        shortBreakTime: 5,
        sections: 5);
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
          'Pomodoro Timer',
          style: kAppBarText,
        ),
      ),
      body: ListView.builder(
        itemCount: pomodoroList.pomodoroList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PomodoroTimerPage(
                pomodoro: pomodoroList.pomodoroList[index],
              ),
            ),
          ),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.timer),
              title: Text(pomodoro.name),
            ),
          ),
        ),
      ),
    );
  }
}
