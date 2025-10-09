import 'package:assessment_task/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/footer.dart';
import '../../../core/widgets/week_header.dart';
import '../../../core/widgets/week_list.dart';
import '../model/training_calender_model.dart';
import '../view_model/training_view_model.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PlanViewModel>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        titleSpacing: 16.w,
        title: CustomText(
          text: 'Training Calendar',
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),

        actions: [
          TextButton(
            onPressed: vm.savePlan,
            child: CustomText(
              text: "Save",
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(height: 2, color: AppColors.appBarElevationColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            buildWeekHeader(vm),
            SizedBox(height: 10.h),
            Expanded(child: buildWeekList(vm)),
            Divider(height: 2, color: AppColors.bottomDividerColor),
            buildFooter(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
