import 'package:componentss/features/baking/UI/baking_screen.dart';
import 'package:componentss/features/baking/data/mission/mission_model.dart';
import 'package:componentss/features/baking/UI/questions/even/answer_block.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerScreen extends StatefulWidget {
  final Mission mission;

  const AnswerScreen({super.key, required this.mission});

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
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
              left: 44.w,
              top: 2032.h,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => AnswerBlock(
                            mission: widget.mission,
                          ), // Replace with your actual screen
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
            Positioned(
              left: 45.w,
              top: 341.h,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 4,
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
                      "Stage ${widget.mission.stage}-${widget.mission.index}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF6B6B6B) /* dark-gray */,
                        fontSize: 44.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w700,
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
                '모범 답안 작성하기',
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
              top: 600.h,
              child: Text(
                '면접관의 질문에 나만의 답변을 작성해보아요!',
                style: TextStyle(
                  color: const Color(0xFF8E95A2),
                  fontSize: 44.w,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.44.w,
                ),
              ),
            ),

            Positioned(
              left: 44.50.w,
              top: 750.h,
              child: SizedBox(
                width: 992.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 46.w,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: ShapeDecoration(
                        color: Colors.white /* white */,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2.75.w,
                            color: const Color(0xFFFF9F1C) /* main-orange */,
                          ),
                          borderRadius: BorderRadius.circular(38.50.r),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 49.60.w,
                        children: [
                          SizedBox(
                            width: 914.84.w,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Q. ',
                                    style: TextStyle(
                                      color: const Color(
                                        0xFFFF9F1C,
                                      ) /* main-orange */,
                                      fontSize: 41.5.w,
                                      fontFamily: 'Wanted Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '최근 직접 진행한 마케팅 경험에 대해 말해주세요',
                                    style: TextStyle(
                                      color: const Color(
                                        0xFF1C1C1C,
                                      ) /* main-black */,
                                      fontSize: 41.5.w,
                                      fontFamily: 'Wanted Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 262.h,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
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
                        spacing: 49.60.w,
                        children: [
                          SizedBox(
                            width: 914.84.w,
                            height: 195.87.h,
                            child: Text(
                              '➀ 작성한 것은 나중에 수정할 수 있어요\n➁ ‘시작하기\'를 누르고 24시간 안에 작성해주세요\n➂ 나만이 가지고 있는 차별점을 살려 작성해보아요\n',
                              style: TextStyle(
                                color: const Color(0xFF6B6B6B) /* dark-gray */,
                                fontSize: 39.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w500,
                                height: 1.65,
                              ),
                            ),
                          ),
                        ],
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
