class WorkoutCardModel {
  final String id;
  final String title;
  final String type;
  final String duration;

  WorkoutCardModel({
    required this.id,
    required this.title,
    required this.type,
    required this.duration,
  });
}

class DayModel {
  final String weekday;
  final String date;
  WorkoutCardModel? assignedWorkout;

  DayModel({
    required this.weekday,
    required this.date,
    this.assignedWorkout,
  });
}

class DragPayload {
  final int fromIndex;
  final WorkoutCardModel workout;

  DragPayload({required this.fromIndex, required this.workout});
}
