import 'package:componentss/features/baking/UI/questions/baking_screen.dart';
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
              left: 270.w,
              top: 418.h,
              child: Container(
                width: 240.w,
                height: 240.h,
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
              left: 101.w,
              top: 1396.h,
              child: Container(
                width: 240.w,
                height: 240.h,
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
              left: 339.w,
              top: 2364.h,
              child: Container(
                width: 240.w,
                height: 240.h,
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
              left: 551.w,
              top: 1056.h,
              child: Container(
                width: 240.w,
                height: 240.h,
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
              left: 459.w,
              top: 1721.h,
              child: Container(
                width: 240.w,
                height: 240.h,
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
              left: 722.w,
              top: 621.h,
              child: Container(
                width: 240.w,
                height: 240.h,
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
              left: 754.w,
              top: 2108.h,
              child: Container(
                width: 240.w,
                height: 240.h,
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
              left: 1.w,
              top: 135.h,
              child: Container(
                width: 1080.w,
                height: 120.h,
                padding: const EdgeInsets.only(
                  top: 13.75,
                  left: 55,
                  right: 77,
                  bottom: 13.75,
                ),
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
