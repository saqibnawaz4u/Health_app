import 'package:assessment_task/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/calender_bottom_sheet.dart';
import '../../../core/widgets/date_selector.dart';

import '../../../core/widgets/workout_card.dart';
import '../../../core/widgets/insight_card.dart';
import '../../../core/widgets/hydration_card.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../../../core/constants/app_colors.dart';
import '../viewModel/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final model = vm.data;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset('assets/icons/notification.svg'),
                    ),
                    Expanded(
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => CalendarBottomSheet(
                                selectedDate: vm.selectedDate,
                                onDateSelected: vm.selectDate,
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(text:"Week ${vm.weekOfMonth}/4", color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500, ),

                              const SizedBox(width: 2),
                              const Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 10),

                DateSelector(
                  dates: vm.currentWeekDates,
                  selectedDate: vm.selectedDate,
                  onDateSelected: vm.selectDate,
                ),

                const SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 5.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    CustomText(text:  "Workouts", color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,),

                    Spacer(),
                    Consumer<HomeViewModel>(
                      builder: (context, vm, _) {
                        return SvgPicture.asset(
                          vm.isNightTime ? 'assets/icons/moon.svg' : 'assets/icons/sun.svg',
                          height: 24.h,
                          width: 24.w,
                        );
                      },
                    ),
                    SizedBox(width: 20.w),
                    CustomText(text: vm.temperature, color: AppColors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,),

                  ],
                ),
                const SizedBox(height: 10),
                WorkoutCard(
                  title: model.workoutTitle,
                  subtitle: 'December 22 - 25m -30m',
                ),

                const SizedBox(height: 20),
                CustomText(text: "My Insights", color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,),


                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: InsightCard(
                        height: 170.h,
                        mainValue: "550",
                        title: "Calories",
                        subLabel: "1950 Remaining",
                        progress: 550 / 2500,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: InsightCard(
                        height: 170.h,
                        mainValue: "75",
                        title: "kg",
                        subLabel: "+1.6kg",
                        bottomLabel: 'Weight',
                        icon: Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                HydrationCard(progress: model.hydration / 100, currentMl: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
