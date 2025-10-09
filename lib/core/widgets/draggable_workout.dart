import 'package:assessment_task/core/widgets/plan_workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/plan/model/training_calender_model.dart';

class DraggableWorkoutCard extends StatelessWidget {
   WorkoutCardModel? workout;
   int? dayIndex;
   VoidCallback? onRemove;

   DraggableWorkoutCard({
    required this.workout,
    required this.dayIndex,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<DragPayload>(
      data: DragPayload(fromIndex: dayIndex!, workout: workout!),
      feedback: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 120.w,
          child: PlanWorkoutCard(workout: workout, isDragging: true),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: PlanWorkoutCard(workout: workout),
      ),
      child: PlanWorkoutCard(workout: workout, onRemove: onRemove),
    );
  }
}