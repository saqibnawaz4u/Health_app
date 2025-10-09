import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/plan/model/training_calender_model.dart';
import '../constants/app_colors.dart';

class PlanWorkoutCard extends StatelessWidget {
   WorkoutCardModel? workout;
  final bool isDragging;
  final VoidCallback? onRemove;

   PlanWorkoutCard({
    required this.workout,
    this.isDragging = false,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.r),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: isDragging ? 10 : 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: const Border(
          left: BorderSide(color: AppColors.white, width: 5),
        ),
      ),
      child: Row(
        children: [

          Stack(
            alignment: Alignment.centerLeft,
            children: [

              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: SizedBox(
                  width: 16.w,
                  height: 28.h,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 3.w,   // horizontal gap
                    runSpacing: 3.h, // vertical gap
                    children: List.generate(6, (_) => _dotPlain()),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade700,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    workout!.type,
                    style: TextStyle(color: Colors.white70, fontSize: 10.sp),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  workout!.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                workout!.duration,
                style: TextStyle(color: AppColors.white, fontSize: 14.sp,fontWeight: FontWeight.w400,),
              ),
              // if (onRemove != null)
              //   Padding(
              //     padding: EdgeInsets.only(left: 6.w),
              //     child: GestureDetector(
              //       onTap: onRemove,
              //       child: const Icon(
              //         Icons.close_rounded,
              //         size: 16,
              //         color: Colors.white54,
              //       ),
              //     ),
              //   ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dotPlain() => Container(
    height: 4.h,
    width: 4.h,
    decoration: BoxDecoration(
      color: Colors.white38,
      borderRadius: BorderRadius.circular(10.r),
    ),
  );

}