class Pomodoro {
  String name = 'New Timer';
  String task = 'New Task';
  int focusTime = 25;
  int breakQuantity = 4;
  int shortBreakTime = 5;
  int longBreakTime = 15;

  Pomodoro(
      {required int focusTime,
      required int breakQuantity,
      required int longBreakTime,
      required int shortBreakTime}) {
    this.focusTime = focusTime;
    this.breakQuantity = breakQuantity;
    this.longBreakTime = longBreakTime;
    this.shortBreakTime = shortBreakTime;
  }

  // void setBreakQuantity(int breakQuantity) {
  //   _breakQuantity = breakQuantity;
  // }
  //
  // void setFocusTime(int time) {
  //   _focusTime = time;
  // }
  //
  // void setShortBreakTime(int time) {
  //   _focusTime = time;
  // }
  //
  // void setLongBreakTime(int time) {
  //   _focusTime = time;
  // }
  //
  // int getBreakQuantity() {
  //   return _breakQuantity;
  // }
  //
  // int getFocusTime() {
  //   return _focusTime;
  // }
  //
  // int getShortBreakTime() {
  //   return _shortBreakTime;
  // }
  //
  // int getLongBreakTime() {
  //   return _longBreakTime;
  // }
}
