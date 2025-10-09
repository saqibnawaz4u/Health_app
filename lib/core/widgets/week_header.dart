import 'package:assessment_task/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/plan/view_model/training_view_model.dart';
import '../constants/app_colors.dart';

Widget buildWeekHeader(PlanViewModel vm) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CustomText(
            text: "Week ${vm.currentWeek}/${vm.totalWeeks}",
            color: AppColors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),

          const Spacer(),
          CustomText(
            text: "Total: ${vm.totalTime}",
            color: Colors.white70,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
      SizedBox(height: 4.h),
      CustomText(
        text: vm.dateRange,
        color: Colors.white54,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
    ],
  );
}
