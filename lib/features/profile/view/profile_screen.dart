import 'package:assessment_task/core/constants/app_colors.dart';
import 'package:assessment_task/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            CustomText(
              text: "Name: Saqib Nawaz",
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 20.sp,
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Email: nawazsaqib208@gmail.com",
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 20.sp,
            ),
            SizedBox(height: 50.h),
            Center(
              child: CustomText(
                text: "Thank You!",
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
