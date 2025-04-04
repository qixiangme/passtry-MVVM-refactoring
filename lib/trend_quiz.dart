import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendQuiz extends StatelessWidget {
  const TrendQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1080.w,
        height: 2400.h,
        decoration: BoxDecoration(color: const Color(0xFFFAFAFA)),
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
              left: 46.w,
              top: 567.h,
              child: Container(
                width: 992.w,
                height: 522.h,
                padding: const EdgeInsets.all(2),
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 3.w,
                      color: const Color(0xFFEBEBEB) /* light-gray */,
                    ),
                    borderRadius: BorderRadius.circular(33.w),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 58.w,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 3,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFF9F1C) /* main-orange */,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(52.94.w),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 41.10.w,
                        children: [
                          Text(
                            'Q1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white /* white */,
                              fontSize: 48.w,
                              fontFamily: 'Wanted Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 904.w,
                      child: Text(
                        '정보가 파악되지 않아 사회가 공식적으로 계측하는 경제활동 추계에 포함되지 않는 경제활동은?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF1C1C1C) /* main-black */,
                          fontSize: 45.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 550.w,
              top: 1345.h,
              child: Container(
                width: 486.w,
                height: 409.h,
                padding: const EdgeInsets.all(44),
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
                      '➁\n지하경제',
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
              left: 44.w,
              top: 1783.h,
              child: Container(
                width: 486.w,
                height: 409.h,
                padding: const EdgeInsets.all(44),
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
                      '➂\n범위의 경제  ',
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
              left: 44.w,
              top: 1345.h,
              child: Container(
                width: 486.w,
                height: 409.h,
                padding: const EdgeInsets.all(44),
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.75.w,
                      color: const Color(0xFFFF9F1C) /* main-orange */,
                    ),
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
                      '➀\n규모의 경제',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFFF9F1C) /* main-orange */,
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
              left: 550.w,
              top: 1783.h,
              child: Container(
                width: 486.w,
                height: 409.h,
                padding: const EdgeInsets.all(44),
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.75.w,
                      color: const Color(0xFFFF9F1C) /* main-orange */,
                    ),
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
                      '➃\n갈라파고스 경제 ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFFF9F1C) /* main-orange */,
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
