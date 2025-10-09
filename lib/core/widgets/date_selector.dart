import 'package:assessment_task/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatelessWidget {
  final List<DateTime> dates;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DateSelector({
    super.key,
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
  });

  String _getFormattedDateText() {
    final now = DateTime.now();
    final isToday = selectedDate.year == now.year &&
        selectedDate.month == now.month &&
        selectedDate.day == now.day;

    final formattedDate = DateFormat('d MMM yyyy').format(selectedDate);
    final dayName = DateFormat('EEEE').format(selectedDate);

    return isToday ? 'Today, $formattedDate' : '$dayName, $formattedDate';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          _getFormattedDateText(),
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: dates.map((date) {
                  final isSelected = date.day == selectedDate.day &&
                      date.month == selectedDate.month &&
                      date.year == selectedDate.year;

                  return GestureDetector(
                    onTap: () => onDateSelected(date),
                    child: Column(
                      children: [
                        Text(
                          ["M", "T", "W", "T", "F", "S", "S"][date.weekday - 1],
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.green
                                  : AppColors.transparent,
                              width: 2,
                            ),
                          ),
                          padding: EdgeInsets.all(10.w),
                          child: Text(
                            "${date.day}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
