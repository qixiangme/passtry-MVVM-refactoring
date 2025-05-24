
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedHalfCircleProgress extends StatefulWidget {
  final double progress; // 진행률 (0.0 ~ 1.0)

  const AnimatedHalfCircleProgress({super.key, required this.progress});

  @override
  _AnimatedHalfCircleProgressState createState() =>
      _AnimatedHalfCircleProgressState();
}

class _AnimatedHalfCircleProgressState extends State<AnimatedHalfCircleProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.progress,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedHalfCircleProgress oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 진행률이 변경되었을 때 애니메이션 업데이트
    if (oldWidget.progress != widget.progress) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.progress,
      ).animate(_controller);
      _controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(900.w, 450.h),
          painter: HalfCircleProgressPainter(progress: _animation.value),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HalfCircleProgressPainter extends CustomPainter {
  final double progress; // 진행률 (0.0 ~ 1.0)

  HalfCircleProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint =
        Paint()
          ..color = const Color(0xFFD9D9D9)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Paint progressPaint =
        Paint()
          ..color = const Color(0xFFFF9F1C)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    // 배경 반원 그리기
    canvas.drawArc(rect, pi, pi, false, backgroundPaint);

    // 진행률에 따른 반원 그리기
    canvas.drawArc(rect, pi, pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Quest {
  final String title;
  final String subtitle;
  final String stage;
  final bool isCompleted;

  Quest({
    required this.title,
    required this.subtitle,
    required this.stage,
    required this.isCompleted,
  });
}

