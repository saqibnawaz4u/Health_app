import 'package:assessment_task/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12.r),
          border: const Border(
            left: BorderSide(color: Color(0xFF1C8C8A), width: 5),
          ),
        ),
        padding: EdgeInsets.all(20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: subtitle,
                    color: Colors.white60,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),

                  SizedBox(height: 6.h),
                  CustomText(
                    text: title,
                    color: AppColors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward, color: Colors.white54, size: 16),
          ],
        ),
      ),
    );
  }
}
