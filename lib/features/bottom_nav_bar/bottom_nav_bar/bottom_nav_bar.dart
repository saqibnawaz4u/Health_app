import 'package:assessment_task/features/home/view/home_screen.dart';
import 'package:assessment_task/features/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';


import '../../../core/widgets/bottom_nav_bar.dart';
import '../../mood/view/mood_screen.dart';

import '../../plan/view/training_calender.dart';
import '../bottom_nav_bar_view_model/bottom_nav_bar_view_model.dart';
import 'bottom_nav_bar.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BottomNavViewModel>();

    // Screens for each tab
    final screens = const [
      HomeScreen(),
      PlanScreen(),
      MoodScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: vm.currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: vm.currentIndex,
        onTap: (index) => vm.changeIndex(index),
      ),
    );
  }
}
