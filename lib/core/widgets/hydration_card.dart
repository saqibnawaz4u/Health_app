import 'package:assessment_task/core/widgets/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class HydrationCard extends StatelessWidget {
  final double progress;
  final double currentMl;
  final VoidCallback? onLogTap;

  const HydrationCard({
    super.key,
    required this.progress,
    required this.currentMl,
    this.onLogTap,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).toInt();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "$percent%",
                        color: AppColors.secondary,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),

                      SizedBox(height: 8.h),
                      CustomText(
                        text: "Hydration",
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),

                      SizedBox(height: 4.h),
                      GestureDetector(
                        onTap: onLogTap,
                        child: CustomText(
                          text: "Log Now",
                          color: Colors.white60,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 100.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "2 L",
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: "0 L",
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(width: 6.w),

                        Expanded(
                          child: Stack(
                            children: [
                              _dottedScale(),
                              LineChart(
                                LineChartData(
                                  minX: 0,
                                  maxX: 1,
                                  minY: 0,
                                  maxY: 2,
                                  backgroundColor: Colors.transparent,
                                  titlesData: FlTitlesData(show: false),
                                  gridData: FlGridData(show: false),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      isCurved: false,
                                      color: Colors.blueGrey.shade900,
                                      dotData: const FlDotData(show: true),
                                      spots: const [FlSpot(0, 0), FlSpot(0, 2)],
                                      barWidth: 2,
                                    ),

                                    LineChartBarData(
                                      isCurved: false,
                                      color: Colors.lightBlueAccent,
                                      dotData: FlDotData(
                                        show: true,
                                        getDotPainter:
                                            (spot, percent, barData, index) =>
                                                FlDotCirclePainter(
                                                  radius: 4,
                                                  color: Colors.lightBlueAccent,
                                                  strokeWidth: 0,
                                                ),
                                      ),
                                      spots: [
                                        const FlSpot(0, 0),
                                        FlSpot(0, currentMl.clamp(0, 2)),
                                      ],
                                      barWidth: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.white24,
                          width: 150.w,
                        ),
                        CustomText(
                          text: "${(currentMl * 1000).toInt()}ml",
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "2 L",
                  //           style: TextStyle(
                  //             color: Colors.white70,
                  //             fontSize: 10.sp,
                  //           ),
                  //         ),
                  //         SizedBox(width: 6.w),
                  //         _dot(isSmall: true),
                  //       ],
                  //     ),
                  //
                  //     SizedBox(height: 6.h),
                  //     Column(
                  //       // crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: List.generate(
                  //         3,
                  //             (index) => Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 6.h),
                  //           child: _dot(isSmall: false),
                  //         ),
                  //       ),
                  //     ),
                  //
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "0 L",
                  //           style: TextStyle(
                  //             color: Colors.white70,
                  //             fontSize: 10.sp,
                  //           ),
                  //         ),
                  //         SizedBox(width: 6.w),
                  //         Expanded(
                  //           child: Container(
                  //             height: 1,
                  //             color: Colors.white24,
                  //           ),
                  //         ),
                  //         Text(
                  //           "${currentMl}ml",
                  //           style: TextStyle(
                  //             color: Colors.white70,
                  //             fontSize: 10.sp,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.hydrationBottomColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.r),
              ),
            ),
            alignment: Alignment.center,
            child: CustomText(
              text: "500 ml added to water log",
              color: Colors.white70,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dottedScale() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(10, (_) {
        return Container(
          height: 4,
          width: 7,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade700,
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}
