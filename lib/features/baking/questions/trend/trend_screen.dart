import 'package:componentss/features/baking/baking_screen.dart';
import 'package:componentss/features/baking/questions/trend/trend_quiz.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendScreen extends StatefulWidget {
  const TrendScreen({super.key});

  @override
  State<TrendScreen> createState() => _trendScreenState();
}

class _trendScreenState extends State<TrendScreen> {
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
              top: 140.h,
              left: 35.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              BakingScreen(), // Replace with your actual screen
                    ),
                  );
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
                  vertical: 4,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFEBEBEB) /* light-gray */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29.57.w),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //spacing: 29.57.w,
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
              left: 45.w,
              top: 600.h,
              child: Text(
                '최근 일주일 간 면접에서 많이 언급된 시사 트렌드를\nOX퀴즈, 객관식으로 공부해보아요!',
                style: TextStyle(
                  color: const Color(0xFF8E95A2),
                  fontSize: 44.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                  height: 4.h,
                  letterSpacing: -0.44.w,
                ),
              ),
            ),
            Positioned(
              left: 44.w,
              top: 2032.h,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              TrendQuiz(), // Replace with your actual screen
                    ),
                  );
                },
                child: Container(
                  width: 993.w,
                  height: 160.h,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33.w),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //spacing: 27.50.w,
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
            ),
          ],
        ),
      ),
    );
  }
}
