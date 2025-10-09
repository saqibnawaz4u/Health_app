import 'package:flutter/material.dart';
import '../model/training_calender_model.dart';

class PlanViewModel extends ChangeNotifier {
  int currentWeek = 2;
  int totalWeeks = 8;
  String dateRange = "December 8–14";
  String totalTime = "60min";

  final List<WorkoutCardModel> availableWorkouts = [
    WorkoutCardModel(
      id: '1',
      title: "Arm Blaster",
      type: "Arms Workout",
      duration: "25m - 30m",
    ),
    WorkoutCardModel(
      id: '2',
      title: "Leg Day Blitz",
      type: "Leg Workout",
      duration: "25m - 30m",
    ),
  ];

  // Pre-assigned workouts for specific days
  late final List<DayModel> weekDays = [
    DayModel(weekday: "Mon", date: "8", assignedWorkout: availableWorkouts[0]),
    DayModel(weekday: "Tue", date: "9"),
    DayModel(weekday: "Wed", date: "10"),
    DayModel(weekday: "Thu", date: "11", assignedWorkout: availableWorkouts[1]),
    DayModel(weekday: "Fri", date: "12"),
    DayModel(weekday: "Sat", date: "13"),
    DayModel(weekday: "Sun", date: "14"),
  ];

  void assignWorkoutToDay(int dayIndex, WorkoutCardModel workout) {
    weekDays[dayIndex].assignedWorkout = workout;
    notifyListeners();
  }

  void removeWorkoutFromDay(int dayIndex) {
    weekDays[dayIndex].assignedWorkout = null;
    notifyListeners();
  }

  void moveWorkout(int fromIndex, int toIndex) {
    if (fromIndex == toIndex) return;
    final fromWorkout = weekDays[fromIndex].assignedWorkout;
    if (fromWorkout == null) return;

    weekDays[fromIndex].assignedWorkout = null;
    weekDays[toIndex].assignedWorkout = fromWorkout;
    notifyListeners();
  }

  void savePlan() {
    debugPrint("✅ Plan saved");
  }
}
