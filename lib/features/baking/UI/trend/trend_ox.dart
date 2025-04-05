import 'package:componentss/features/baking/UI/baking_screen.dart';
import 'package:componentss/features/baking/data/mission/mission_model.dart';
import 'package:componentss/features/baking/UI/questions/odd/odd_quiz.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendOx extends StatefulWidget {
  const TrendOx({super.key});

  @override
  State<TrendOx> createState() => _TrendOxState();
}

class _TrendOxState extends State<TrendOx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1080.w,
        height: 2400.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: const Color(0xFFFAFAFA)),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(width: 1080.w, height: 105.h),
            ),
            Positioned(
              left: 0,
              top: 135.h,
              child: Container(width: 1080.w, height: 120.h),
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
              left: 44.w,
              top: 1783.h,
              child: Container(
                width: 992.w,
                height: 409.h,
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
                      'O',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white /* white */,
                        fontSize: 120.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -1.20.w,
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
                width: 992.w,
                height: 409.h,
                padding: const EdgeInsets.all(44),
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.75.w,
                      color: const Color(0xFFFF9F1C) /* main-orange */,
                    ),
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
                      'X',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFFF9F1C) /* main-orange */,
                        fontSize: 120.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -1.20.w,
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
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 3.w,
                      color: const Color(0xFFEBEBEB) /* light-gray */,
                    ),
                    borderRadius: BorderRadius.circular(33.r),
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
                        horizontal: 11,
                        vertical: 2,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFF9F1C) /* main-orange */,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(52.94.r),
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
                      width: 1000.w,
                      child: Text(
                        '정보가 파악되지 않아 사회가 공식적으로 계측하는 경제활동 추계에 포함되지 않는 경제활동은?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF1C1C1C) /* main-black */,
                          fontSize: 48.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w500,
                          height: 1.2,
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
