import 'dart:async';

import 'package:flutter/material.dart';
import '../model/home_model.dart';

class HomeViewModel extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  int selectedIndex = 0;
  late Timer _timer;
  String get temperature => '9\u00B0';

  HomeViewModel() {

    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      notifyListeners();
    });
  }

  List<DateTime> get currentWeekDates {
    final today = selectedDate;
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    return List.generate(7, (i) => startOfWeek.add(Duration(days: i)));
  }

  int get weekOfMonth {
    final firstDay = DateTime(selectedDate.year, selectedDate.month, 1);
    return ((selectedDate.day + firstDay.weekday - 1) / 7).ceil();
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  bool get isNightTime {
    final hour = DateTime.now().hour;
    return hour < 6 || hour >= 18;
  }



  void setNavIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  HomeModel data = HomeModel(
    calories: 550,
    weight: 75,
    hydration: 0,
    workoutTitle: "Upper Body",
  );
}
