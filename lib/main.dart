import 'package:assessment_task/features/bottom_nav_bar/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:assessment_task/features/bottom_nav_bar/bottom_nav_bar_view_model/bottom_nav_bar_view_model.dart';
import 'package:assessment_task/features/mood/view/mood_screen.dart';
import 'package:assessment_task/features/plan/view/training_calender.dart';
import 'package:assessment_task/features/plan/view_model/training_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'features/home/view/home_screen.dart';
import 'core/constants/app_colors.dart';
import 'features/home/viewModel/home_view_model.dart';
import 'features/mood/view_model/mood_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>BottomNavViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => PlanViewModel()),
        ChangeNotifierProvider(create: (_) => MoodViewModel()),

      ],
      child: ScreenUtilInit(
        designSize: const Size(439, 956),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fitness App',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.background,
              primaryColor: AppColors.primary,
              useMaterial3: true,
            ),
            home: const BottomNavScreen(),
          );
        },
      ),
    );
  }
}
