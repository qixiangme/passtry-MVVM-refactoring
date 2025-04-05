import 'package:componentss/features/baking/UI/questions/baking_screen.dart';
import 'package:componentss/features/baking/data/mission/mission_model.dart';
import 'package:componentss/features/baking/UI/questions/odd/odd_quiz.dart';
import 'package:componentss/features/baking/UI/questions/trend/trend_quiz.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OddScreen extends StatefulWidget {
  final Mission mission;

  const OddScreen({super.key, required this.mission});

  @override
  State<OddScreen> createState() => _OddScreenState();
}

class _OddScreenState extends State<OddScreen> {
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
                '랜덤 질문에 즉석 답변 연습하기',
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
                '제한 시간에 맞추어 2개 답변에 바로 답변해보아요!',
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
              left: 45.w,
              top: 800.h,
              child: Container(
                width: 1000.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 38.58.r,
                  vertical: 33.07.r,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.75.w,
                      color: const Color(0xFFEBEBEB) /* light-gray */,
                    ),
                    borderRadius: BorderRadius.circular(38.50.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 49.60.r,
                  children: [
                    SizedBox(
                      width: 914.84.w,
                      height: 264.h,
                      child: Text(
                        '➀ 제한 시간은 질문 난이도에 따라 달라요\n➁ 답변 연습이 목적이니 최대한 말을 정갈하게 해보는 것에 최선을 다해보세요!\n➂ 그동안 모범 답안 작성했던 질문 중 출제되어요',
                        style: TextStyle(
                          color: const Color(0xFF6B6B6B) /* dark-gray */,
                          fontSize: 40.sp,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w500,
                          height: 3.65.h,
                        ),
                      ),
                    ),
                  ],
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OddQuiz(mission: widget.mission),
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
                          '답변 작성 시작하기',
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
            ),
          ],
        ),
      ),
    );
  }
}
