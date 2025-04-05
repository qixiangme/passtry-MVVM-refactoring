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
      body: Container(
        width: 1080.w,
        height: 2857.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0.w,
              top: -67.h,
              child: Container(
                width: 1080.w,
                height: 3575.h,
                decoration: BoxDecoration(color: const Color(0xFF95E08A)),
              ),
            ),
            Positioned(
              top: 281.h,
              child: Image.asset('assets/images/stage_road.png'),
              width: 1080.w,
              height: 2000.h,
            ),
            Positioned(
              right: 200,
              top: 1860.h,
              child: Image.asset('assets/images/road_bottom.png'),
              width: 380.w,
              height: 900.h,
            ),
            Positioned(
              left: 1002.w,
              top: 4692.h,
              child: Container(
                transform:
                    Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(3.14),
                width: 903.w,
                height: 2328.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Stack(),
              ),
            ),
            Positioned(
              left: 99.w,
              top: 253.h,
              child: Container(
                width: 903.w,
                height: 2328.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Stack(),
              ),
            ),
            Positioned(
              // 첫 번째 동그라미
              left: 300.w,
              top: 420.h,
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 15.r,
                      offset: Offset(0, 0),
                      spreadRadius: 0.r,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // 네 번째 동그라미
              left: 150.w,
              top: 1280.h,
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 15.r,
                      offset: Offset(0, 0),
                      spreadRadius: 0.r,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // 일곱 번째 동그라미미
              left: 400.w,
              top: 2100.h,
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 15.r,
                      offset: Offset(0, 0),
                      spreadRadius: 0.r,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              //세 번째 동그라미
              left: 530.w,
              top: 980.h,
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 15.r,
                      offset: Offset(0, 0),
                      spreadRadius: 0.r,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // 다섯 번째 동그라미미
              left: 500.w,
              top: 1550.h,
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 15.r,
                      offset: Offset(0, 0),
                      spreadRadius: 0.r,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // 두 번째 동그라미
              left: 710.w,
              top: 621.h,
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 15.r,
                      offset: Offset(0, 0),
                      spreadRadius: 0.r,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // 여섯 번째 동그라미
              left: 730.w,
              top: 1850.h,
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 15.r,
                      offset: Offset(0, 0),
                      spreadRadius: 0.r,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0.w,
              top: 0.h,
              child: Container(
                width: 1081.w,
                height: 281.h,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              top: 120.h,
              right: 30,
              child: Container(
                width: 1080.w,
                height: 120.h,
                padding: const EdgeInsets.only(top: 10),
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
                          fontSize: 60.w,
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
    );
  }
}
