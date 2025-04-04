import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BakingScreen extends StatefulWidget {
  const BakingScreen({super.key});

  @override
  State<BakingScreen> createState() => _BakingScreenState();
}

class _BakingScreenState extends State<BakingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Text("logo")),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 1000.w,
                        height: 200.h,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0x21FF9F1C),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2.96.w,
                              color: const Color(0xFFFF9F1C) /* main-orange */,
                            ),
                            borderRadius: BorderRadius.circular(29.57.w),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 29.57.w,
                          children: [
                            Text(
                              '동아리 면접',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 36.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
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
                        ),

                        Container(
                          width: 130.w,
                          height: 154.h,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.r),
                          ),
                        ),

                        Container(
                          width: 130.w,
                          height: 154.h,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.r),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Center(child: AnimatedHalfCircleProgress()),
                        Padding(
                          padding: EdgeInsets.only(top: 90),
                          child: Center(
                            child: Container(
                              width: 611.w,
                              height: 500.h,
                              decoration: BoxDecoration(
                                color: Color(0XFF6B6B6B),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0x21FF9F1C),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2.96.w,
                              color: const Color(0xFFFF9F1C) /* main-orange */,
                            ),
                            borderRadius: BorderRadius.circular(29.57.w),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 29.57.w,
                          children: [
                            Text(
                              'Lv.0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(
                                  0xFFFF9F1C,
                                ) /* main-orange */,
                                fontSize: 36.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Center(
                      child: Text(
                        '따끈따끈한 반죽',
                        style: TextStyle(
                          color: Colors.black /* white */,
                          fontSize: 66.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '이번 주 출석 현황',
                        style: TextStyle(
                          color: Colors.black /* white */,
                          fontSize: 50.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: 1000.w,
                        height: 300.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(38.50.w),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(7, (index) {
                            // Replace this with your logic to check if the day is attended
                            bool isAttended =
                                Random().nextBool(); // Example logic
                            return Container(
                              width: 100.w,
                              height: 230.h,
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              decoration: BoxDecoration(
                                color:
                                    isAttended
                                        ? const Color(
                                          0xFFFF9F1C,
                                        ) // Yellow for attended
                                        : const Color(
                                          0xFFD9D9D9,
                                        ), // Gray for not attended
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 70),
                                child: Center(
                                  child: Text(
                                    ['월', '화', '수', '목', '금', '토', '일'][index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 36.w,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '일일 퀘스트',
                        style: TextStyle(
                          color: Colors.black /* white */,
                          fontSize: 50.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 992.w,
                        height: 302.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38.50.w),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 992.w,
                        height: 302.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38.50.w),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 992.w,
                        height: 302.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38.50.w),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '일일 퀘스트',
                        style: TextStyle(
                          color: Colors.black /* white */,
                          fontSize: 50.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 992.w,
                        height: 302.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38.50.w),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 992.w,
                        height: 302.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38.50.w),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 992.w,
                        height: 302.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38.50.w),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 24,
              top: 7,
              child: Icon(Icons.circle, size: 40, color: Color(0xffFF9F1C)),
            ),
            Positioned(
              right: 20,
              child: SizedBox(
                width: 120.w,
                height: 120.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 31.20.w,
                      top: 34.80.h,
                      child: Text(
                        '27',
                        style: TextStyle(
                          color: Colors.white /* white */,
                          fontSize: 48.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.48.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
