import 'package:flutter/material.dart';
import 'package:pomodoro_timer/models/pomodoro_list.dart';
import 'package:pomodoro_timer/util/constants.dart';
import 'package:pomodoro_timer/views/pomodoro/pomodoro_list_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final List _screensList = [
    ListenableProvider(
        create: (context) => PomodoroList(), child: PomodoroListPage()),
  ];

  void _updatePageIndex(int value) {
    setState(() {
      _currentPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screensList[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kSecondaryColor,
        currentIndex: _currentPageIndex,
        onTap: (value) => _updatePageIndex(value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Timers List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Active Timer',
          ),
        ],
        selectedItemColor: kAccentColor,
      ),
    );
  }
}
