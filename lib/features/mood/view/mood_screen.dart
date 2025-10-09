import 'dart:math';
import 'package:assessment_task/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../view_model/mood_view_model.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MoodViewModel>();
    final size = 260.w;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: CustomText(
          text: "Mood",
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(height: 1, color: Colors.white24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Start your day",
              color: AppColors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),

            SizedBox(height: 8.h),
            CustomText(
              text: "How are you feeling at the Moment?",
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
            ),

            SizedBox(height: 40.h),

            Center(
              child: SizedBox(
                width: size,
                height: size,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(size, size),
                      painter: _MoodRingPainter(
                        colors: vm.moods.map((m) => m.color).toList(),
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          vm.currentMood.emoji,
                          height: 70.h,
                          width: 70.w,
                        ),

                        SizedBox(height: 6.h),
                      ],
                    ),

                    _DraggableHandle(size: size, vm: vm),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: CustomText(
                text: vm.currentMood.name,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Selected Mood: ${vm.currentMood.name}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: CustomText(
                  text: "Continue",
                  color: AppColors.background,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class _DraggableHandle extends StatefulWidget {
  final double size;
  final MoodViewModel vm;

  const _DraggableHandle({required this.size, required this.vm});

  @override
  State<_DraggableHandle> createState() => _DraggableHandleState();
}

class _DraggableHandleState extends State<_DraggableHandle> {
  Offset? _ringCenter;
  final GlobalKey _ringKey = GlobalKey();

  void _updateRingCenter() {
    final box = _ringKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      final position = box.localToGlobal(Offset.zero);
      _ringCenter = position + Offset(box.size.width / 2, box.size.height / 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.size / 2.5;
    final radians = (widget.vm.angle - 0) * pi / 180;
    final dx = cos(radians) * radius;
    final dy = sin(radians) * radius;

    return Stack(
      key: _ringKey,
      children: [
        Positioned(
          left: widget.size / 2 + dx - 14.w,
          top: widget.size / 2 + dy - 14.w,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: (_) {
              _updateRingCenter(); // update once before drag starts
            },
            onPanUpdate: (details) {
              if (_ringCenter == null) return;
              final global = details.globalPosition;
              widget.vm.updateAngle(global, _ringCenter!);
            },
            child: Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class _MoodRingPainter extends CustomPainter {
  final List<Color> colors;

  _MoodRingPainter({required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2.5,
    );

    final gradient = SweepGradient(
      colors: [...colors, colors.first],
      stops: [
        0.0,
        1 / colors.length,
        2 / colors.length,
        3 / colors.length,
        1.0,
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
