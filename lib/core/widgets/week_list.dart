import 'package:assessment_task/core/widgets/custom_text.dart';
import 'package:assessment_task/core/widgets/draggable_workout.dart';

import '../../features/plan/model/training_calender_model.dart';
import '../../features/plan/view_model/training_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

Widget buildWeekList(PlanViewModel vm) {
  return ListView.separated(
    itemCount: vm.weekDays.length,
    separatorBuilder: (_, __) => Container(
      height: 1,
      color: Colors.white12,
      margin: EdgeInsets.only(top: 12.h, bottom: 12.h),
    ),
    itemBuilder: (context, index) {
      final day = vm.weekDays[index];
      return DragTarget<DragPayload>(
        onAccept: (payload) => vm.moveWorkout(payload.fromIndex, index),
        builder: (context, candidate, rejected) {
          final hovering = candidate.isNotEmpty;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
              color: hovering
                  ? AppColors.primary.withOpacity(0.6)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   width: 8.w,
                //   height: 44.h,
                //   decoration: BoxDecoration(
                //     color: Colors.white24,
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(10.r),
                //       bottomLeft: Radius.circular(10.r),
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: 44.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: day.weekday,
                        color: Colors.white60,
                        fontSize: 12.sp,
                      ),

                      SizedBox(height: 6.h),
                      CustomText(
                        text: day.date,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: day.assignedWorkout != null
                      ? DraggableWorkoutCard(
                          workout: day.assignedWorkout!,
                          dayIndex: index,
                          onRemove: () => vm.removeWorkoutFromDay(index),
                        )
                      : Container(
                          height: 48.h,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            " ",
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
