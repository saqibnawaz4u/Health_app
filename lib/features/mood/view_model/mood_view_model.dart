import 'dart:math';
import 'package:assessment_task/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../model/mood_model.dart';

class MoodViewModel extends ChangeNotifier {
  double angle = 0; // 0–360 degrees

  late List<Mood> moods;
  late Mood currentMood;

  MoodViewModel() {
    moods = [
      Mood(name: "Happy", color: AppColors.happyColor, emoji: "assets/images/happy.png"),
      Mood(name: "Calm", color: AppColors.calmColor, emoji: "assets/images/calm.png"),
      Mood(name: "Content", color: AppColors.contentColor, emoji: "assets/images/content.png"),
      Mood(name: "Peaceful", color: AppColors.peaceColor, emoji: "assets/images/peaceful.png"),
    ];
    currentMood = moods[1]; // Default "Calm"
  }

  void updateAngle(Offset fingerPosition, Offset ringCenter) {
    final dx = fingerPosition.dx - ringCenter.dx;
    final dy = fingerPosition.dy - ringCenter.dy;

    double newAngle = atan2(dy, dx) * 180 / pi;
    newAngle = (newAngle + 360) % 360;
    angle = newAngle;

    final segment = 360 / moods.length;
    final index = (angle / segment).floor().clamp(0, moods.length - 1);
    currentMood = moods[index];

    notifyListeners();
  }

}
