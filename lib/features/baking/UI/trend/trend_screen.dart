import 'package:componentss/features/baking/UI/baking_screen.dart';
import 'package:componentss/features/baking/data/mission/mission_model.dart';
import 'package:componentss/features/baking/UI/questions/odd/odd_quiz.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendScreen extends StatefulWidget {
  const TrendScreen({super.key});

  @override
  State<TrendScreen> createState() => _TrendScreenState();
}

class _TrendScreenState extends State<TrendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1080.w,
        height: 2400.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0.w,
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
                decoration: BoxDecoration(color: Colors.white /* white */),
              ),
            ),
            Positioned(
              top: 140.h,
              left: 35.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(CustomIcon.back, size: 55.w),
              ),
            ),
            Positioned(
              left: 45.w,
              top: 341.h,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFEBEBEB) /* light-gray */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29.57.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 29.57.w,
                  children: [
                    Text(
                      '최근 트렌드 학습하기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF6B6B6B) /* dark-gray */,
                        fontSize: 36.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 45.w,
              top: 451.62.h,
              child: Text(
                '경제 관련 시사 내용 퀴즈',
                style: TextStyle(
                  color: const Color(0xFF1C1C1C) /* main-black */,
                  fontSize: 76.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              left: 44.50.w,
              top: 588.h,
              child: Text(
                '최근 일주일 간 면접에서 많이 언급된 시사 트렌드를\nOX퀴즈, 객관식으로 공부해보아요!',
                style: TextStyle(
                  color: const Color(0xFF8E95A2),
                  fontSize: 44.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                  height: 3.9.h,
                  letterSpacing: -0.44.w,
                ),
              ),
            ),
            Positioned(
              left: 44.w,
              top: 2032.h,
              child: Container(
                width: 993.w,
                height: 160.h,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFF9F1C) /* main-orange */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 27.50.w,
                  children: [
                    Text(
                      '문제 풀기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white /* white */,
                        fontSize: 50.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.50.w,
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
