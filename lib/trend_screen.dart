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
    return Container(
      width: 1080.w,
      height: 2400.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            left: 0.w,
            top: 0.h,
            child: Container(
              width: 1080.w,
              height: 105.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 60.w,
                    top: 36.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 15.w,
                      children: [
                        Container(
                          width: 45.w,
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          width: 45.w,
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          width: 15.w,
                          height: 15.h,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: OvalBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 726.w,
                    top: 36.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 6.w,
                      children: [
                        Container(
                          width: 45.w,
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          width: 48.w,
                          height: 48.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          width: 45.w,
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          width: 45.w,
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          width: 45.w,
                          height: 45.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                        Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-1.57),
                          height: 48.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 510.w,
                    top: 27.h,
                    child: Container(
                      width: 63.w,
                      height: 63.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0.w,
                            top: 0.h,
                            child: Container(
                              width: 63.w,
                              height: 63.h,
                              decoration: ShapeDecoration(
                                color: Colors.black,
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18.w,
                            top: 18.h,
                            child: Container(
                              width: 27.w,
                              height: 27.h,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF2E2C2C),
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0xFF3E3C3C),
                                    blurRadius: 12.w,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0.w,
                                  ),
                                ],
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
                    opacity: 0.w,
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
            left: 45.w,
            top: 341.h,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
            top: 650.h,
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
    );
  }
}
