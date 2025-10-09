import 'package:assessment_task/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class InsightCard extends StatelessWidget {
  final String title; // e.g., "Calories" or "Weight"
  final String mainValue; // e.g., "550" or "75"
  final String? subLabel; // e.g., "1950 Remaining" or "+1.6kg"
  final double? progress; // optional (0.0–1.0)
  final Widget? icon; // optional icon (arrow up/down)
  final String? bottomLabel; // optional label under progress bar
  final double height; // fixed height for equal cards

  const InsightCard({
    super.key,
    required this.title,
    required this.mainValue,
    this.subLabel,
    this.progress,
    this.icon,
    this.bottomLabel,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$mainValue ",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: title,
                    style: TextStyle(color: Colors.white70, fontSize: 18.sp),
                  ),
                ],
              ),
            ),
            if (subLabel != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null) icon!,
                  if (icon != null) SizedBox(width: 4.w),
                  CustomText(
                    text: subLabel!,
                    color: Colors.white60,
                    fontSize: 14.sp,
                  ),
                ],
              ),
            if (progress != null)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "0",
                        color: Colors.white30,
                        fontSize: 14.sp,
                      ),
                      CustomText(
                        text: "2500",
                        color: Colors.white30,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: LinearProgressIndicator(
                      value: progress!,
                      minHeight: 6.h,
                      color: AppColors.green,
                      backgroundColor: Colors.white12,
                    ),
                  ),
                ],
              )
            else
              SizedBox(height: 10.h),
            bottomLabel != null
                ? CustomText(
                    text: bottomLabel.toString(),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
