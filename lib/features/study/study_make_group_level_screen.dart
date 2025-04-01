import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';

class StudyMakeGroupLevel extends StatefulWidget {
  const StudyMakeGroupLevel({super.key});

  @override
  State<StudyMakeGroupLevel> createState() => _StudyMakeGroupLevelState();
}

class _StudyMakeGroupLevelState extends State<StudyMakeGroupLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(CustomIcon.back, size: 18),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 77.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Text(
              '퀘스트 난이도를 선택해주세요',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontSize: 70.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '준비 기간이 짧다면 난이도 중 이상을 추천해요',
              style: TextStyle(
                color: const Color(0xFF8E95A2),
                fontSize: 44.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.44,
              ),
            ),
        Column(
          children: [
            Container(
              width: 485.w,
              padding: EdgeInsets.only(
                top: 46.h,
                left: 70.w,
                right: 100.w,
                bottom: 46.h,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.75.w,
                    color: const Color(0xFFEBEBEB),
                  ),
                  borderRadius: BorderRadius.circular(38.50.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 52.w,
                children: [
                  Container(
                    width: 116.w,
                    height: 116.w,
                    decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                  ),
                  Text(
                    '난이도 상',
                    style: TextStyle(
                      color: const Color(0xFF434343),
                      fontSize: 40.sp,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.40,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 486.w,
              padding: EdgeInsets.only(
                top: 46.h,
                left: 70.w,
                right: 100.w,
                bottom: 46.h,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.75.w,
                    color: const Color(0xFFEBEBEB),
                  ),
                  borderRadius: BorderRadius.circular(38.50.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 52.w,
                children: [
                  Container(
                    width: 116.w,
                    height: 116.w,
                    decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                  ),
                  Text(
                    '난이도 중',
                    style: TextStyle(
                      color: const Color(0xFF434343),
                      fontSize: 40.sp,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.40,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 485.w,
              padding: EdgeInsets.only(
                top: 46.h,
                left: 70.w,
                right: 100.w,
                bottom: 46.h,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.75.w,
                    color: const Color(0xFFEBEBEB),
                  ),
                  borderRadius: BorderRadius.circular(38.50.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 52.w,
                children: [
                  Container(
                    width: 116.w,
                    height: 116.w,
                    decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                  ),
                  Text(
                    '난이도 하',
                    style: TextStyle(
                      color: const Color(0xFF434343),
                      fontSize: 40.sp,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.40,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 486.w,
              padding: EdgeInsets.only(
                top: 46.h,
                left: 70.w,
                right: 100.w,
                bottom: 46.h,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.75.w,
                    color: const Color(0xFFEBEBEB),
                  ),
                  borderRadius: BorderRadius.circular(38.50.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 52.w,
                children: [
                  Container(
                    width: 116.w,
                    height: 116.w,
                    decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                  ),
                  Text(
                    '난이도 기초',
                    style: TextStyle(
                      color: const Color(0xFF434343),
                      fontSize: 40.sp,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
