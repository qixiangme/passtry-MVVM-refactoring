import 'package:componentss/features/baking/UI/baking_screen.dart';
import 'package:componentss/features/baking/data/mission/mission_model.dart';
import 'package:componentss/features/baking/UI/questions/odd/odd_quiz.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BakingStage extends StatefulWidget {
  const BakingStage({super.key});

  @override
  State<BakingStage> createState() => _BakingStageState();
}

class _BakingStageState extends State<BakingStage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 1080.w,
          height: 3623.h,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 1080.w,
                  height: 3623.h,
                  decoration: BoxDecoration(color: const Color(0xFFE5E5E5)),
                ),
              ),
              Positioned(
                top: 135.h,
                left: 44.w,
                child: Image.asset(
                  'assets/icons/oven.png',
                  width: 992.w,
                  height: 1092.h,
                ),
              ),
              Positioned(
                left: 90.w,
                top: 1165.h,
                child: Image.asset(
                  'assets/images/StageRoad.png',
                  width: 900.w,
                  height: 2143.h,
                ),
              ),
              Positioned(
                // 두 번째 동그라미
                left: 765.w,
                top: 1470.h,
                child: Stack(
                  children: [
                    Container(
                      width: 240.w,
                      height: 240.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD2D2D2),
                        shape: OvalBorder(),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 15.r,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 83.w,
                      top: 73.h,
                      child: Image.asset(
                        'assets/icons/lock.png',
                        width: 74.w,
                        height: 94.h,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                // 첫 번째 동그라미
                left: 446.w,
                top: 1150.h,
                child: Stack(
                  children: [
                    Container(
                      width: 240.w,
                      height: 240.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD2D2D2),
                        shape: OvalBorder(),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 15.r,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 83.w,
                      top: 73.h,
                      child: Image.asset(
                        'assets/icons/lock.png',
                        width: 74.w,
                        height: 94.h,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                // 네 번째 동그라미
                left: 75.w,
                top: 2123.h,
                child: Stack(
                  children: [
                    Container(
                      width: 240.w,
                      height: 240.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD2D2D2),
                        shape: OvalBorder(),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 15.r,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 83.w,
                      top: 73.h,
                      child: Image.asset(
                        'assets/icons/lock.png',
                        width: 74.w,
                        height: 94.h,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                // 일곱 번째 동그라미
                left: 446.w,
                top: 3067.h,
                child: Stack(
                  children: [
                    Container(
                      width: 240.w,
                      height: 240.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD2D2D2),
                        shape: OvalBorder(),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 15.r,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 83.w,
                      top: 73.h,
                      child: Image.asset(
                        'assets/icons/lock.png',
                        width: 74.w,
                        height: 94.h,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                // 세 번째 동그라미
                left: 446.w,
                top: 1780.h,
                child: Stack(
                  children: [
                    Container(
                      width: 240.w,
                      height: 240.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD2D2D2),
                        shape: OvalBorder(),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 15.r,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 83.w,
                      top: 73.h,
                      child: Image.asset(
                        'assets/icons/lock.png',
                        width: 74.w,
                        height: 94.h,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                // 다섯 번째 동그라미
                left: 446.w,
                top: 2435.h,
                child: Stack(
                  children: [
                    Container(
                      width: 240.w,
                      height: 240.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD2D2D2),
                        shape: OvalBorder(),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 15.r,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 83.w,
                      top: 73.h,
                      child: Image.asset(
                        'assets/icons/lock.png',
                        width: 74.w,
                        height: 94.h,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                // 여섯 번째 동그라미
                left: 770.w,
                top: 2760.h,
                child: Stack(
                  children: [
                    Container(
                      width: 240.w,
                      height: 240.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD2D2D2),
                        shape: OvalBorder(),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 15.r,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 83.w,
                      top: 73.h,
                      child: Image.asset(
                        'assets/icons/lock.png',
                        width: 74.w,
                        height: 94.h,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 393.w,
                top: 3000.h,
                child: Image.asset(
                  'assets/icons/acorn.png',
                  width: 333.77.w,
                  height: 325.h,
                ),
              ),
              Positioned(
                left: 376.w,
                top: 3404.h,
                child: Image.asset(
                  'assets/icons/start.png',
                  width: 367.w,
                  height: 82.h,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 1081,
                  height: 110,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                top: 135.h,
                child: Container(
                  width: 1080.w,
                  height: 120.h,
                  padding: const EdgeInsets.only(top: 5, left: 5, right: 28),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 49.50.w,
                    children: [
                      SizedBox(
                        width: 948.w,
                        child: Text(
                          'STAGE 1',
                          style: TextStyle(
                            color: const Color(0xFF1C1C1C) /* main-black */,
                            fontSize: 60.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.60.w,
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
      ),
    );
  }
}
