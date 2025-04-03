import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailHome extends StatefulWidget {
  const DetailHome({super.key});

  @override
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Color(0xFF434343),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '면접까지',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 130.w,
                  height: 154.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Stack(
                    children: [
                      // 상단 영역
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                            color: Color(0XFFF3F3F3), // 상단 색상
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),
                      // 하단 영역
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80.h, // 하단 영역 높이
                          decoration: BoxDecoration(
                            color: Colors.white, // 하단 색상
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'D',
                          style: TextStyle(
                            color: Color(0XFFFF9F1C),
                            fontSize: 88.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  '-',
                  style: TextStyle(
                    color: Color(0XFFFF9F1C),
                    fontSize: 88.sp,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Container(
                  width: 130.w,
                  height: 154.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Stack(
                    children: [
                      // 상단 영역
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                            color: Color(0XFFF3F3F3), // 상단 색상
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),
                      // 하단 영역
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80.h, // 하단 영역 높이
                          decoration: BoxDecoration(
                            color: Colors.white, // 하단 색상
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'D',
                          style: TextStyle(
                            color: Color(0XFFFF9F1C),
                            fontSize: 88.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 130.w,
                  height: 154.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Stack(
                    children: [
                      // 상단 영역
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                            color: Color(0XFFF3F3F3), // 상단 색상
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),
                      // 하단 영역
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80.h, // 하단 영역 높이
                          decoration: BoxDecoration(
                            color: Colors.white, // 하단 색상
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(35.r),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'D',
                          style: TextStyle(
                            color: Color(0XFFFF9F1C),
                            fontSize: 88.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    width: 611.w,
                    height: 530.h,
                    decoration: BoxDecoration(color: Color(0XFFD9D9D9)),
                  ),
                ),
                Center(child: AnimatedHalfCircleProgress()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedHalfCircleProgress extends StatefulWidget {
  const AnimatedHalfCircleProgress({super.key});

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
      duration: Duration(seconds: 1),
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 0, end: 0.5).animate(_controller);

    _controller.forward();
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
  final double progress;

  HalfCircleProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint =
        Paint()
          ..color = Color(0xFFD9D9D9)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Paint progressPaint =
        Paint()
          ..color = Color(0xFFFF9F1C)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    canvas.drawArc(rect, pi, pi, false, backgroundPaint);
    canvas.drawArc(rect, pi, pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
