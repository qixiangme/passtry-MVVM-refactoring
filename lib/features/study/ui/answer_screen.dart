import 'package:componentss/features/baking/baking_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key});

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
              left: 44.w,
              top: 2032.h,
              child: Container(
                width: 993.w,
                height: 160.h,
                padding: const EdgeInsets.all(44),
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
            Positioned(
              left: 45.w,
              top: 341.h,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFEBEBEB) /* light-gray */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29.57),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 29.57.w,
                  children: [
                    Text(
                      'stage 1-3',
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
              top: 588.h,
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 49.50.w,
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(),
                    ),
                    SizedBox(
                      width: 744.w,
                      child: Text(
                        ' ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF1C1C1C) /* main-black */,
                          fontSize: 55.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.55.w,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0,
                      child: Container(
                        width: 55.w,
                        height: 55.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Stack(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 44.50.w,
              top: 727.h,
              child: Container(
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
                        horizontal: 38.58,
                        vertical: 33.07,
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
                                      fontSize: 44.w,
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
                                      fontSize: 44.w,
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
                        horizontal: 38.58,
                        vertical: 33.07,
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
                              '➀ 작성한 것은 나중에 수정할 수 있어요\n➁ \‘시작하기\'를 누르고 24시간 안에 작성해주세요\n➂ 나만이 가지고 있는 차별점을 살려 작성해보아요\n',
                              style: TextStyle(
                                color: const Color(0xFF6B6B6B) /* dark-gray */,
                                fontSize: 40.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w500,
                                height: 1.65.h,
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
