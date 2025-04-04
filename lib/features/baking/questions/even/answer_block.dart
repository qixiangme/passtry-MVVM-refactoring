import 'package:componentss/features/baking/baking_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerBlock extends StatefulWidget {
  const AnswerBlock({super.key});

  @override
  State<AnswerBlock> createState() => _AnswerBlockState();
}

class _AnswerBlockState extends State<AnswerBlock> {
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
              left: 44.w,
              top: 318.h,
              child: Container(
                width: 992.w,
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
                                color: const Color(0xFF1C1C1C) /* main-black */,
                                fontSize: 41.5.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w700,
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
              left: 44.w,
              top: 482.h,
              child: Container(
                width: 992.w,
                height: 1480.h,
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
                      height: 1413.87.h,
                      child: Text(
                        '답변 작성하기',
                        style: TextStyle(
                          color: const Color(0xFF6B6B6B) /* dark-gray */,
                          fontSize: 40.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w500,
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
              child: Container(
                width: 993.w,
                height: 160.h,
                padding: const EdgeInsets.all(5),
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
                      '제출하기',
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
