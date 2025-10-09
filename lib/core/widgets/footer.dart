import 'package:assessment_task/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildFooter() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Week 2",
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),

            SizedBox(height: 2.h),
            CustomText(
              text: "December 14 - 22",
              color: Colors.white54,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        const Spacer(),
        CustomText(
          text: "Total: 60min",
          color: Colors.white70,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}
