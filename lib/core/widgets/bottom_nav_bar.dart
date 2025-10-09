import 'package:assessment_task/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [
      'assets/icons/nutrition.svg',
      'assets/icons/plan.svg',
      'assets/icons/mood.svg',
      'assets/icons/profile.svg',
    ];

    final labels = ["Nutrition", "Plan", "Mood", "Profile"];

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.background,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: List.generate(icons.length, (i) {
        final bool isSelected = selectedIndex == i;

        return BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icons[i],
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.white : Colors.white54,
              BlendMode.srcIn,
            ),
          ),
          label: labels[i],
        );
      }),
    );
  }
}
