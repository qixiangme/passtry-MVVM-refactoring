import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/icons/custom_icon_icons.dart';

class StudyMakeGroupComplete extends StatefulWidget {
  const StudyMakeGroupComplete({super.key});

  @override
  State<StudyMakeGroupComplete> createState() => _StudyMakeGroupComplete();
}

class _StudyMakeGroupComplete extends State<StudyMakeGroupComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 77.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Text(
              '면접 만점 암기빵 맛집 을 오픈했어요!',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontSize: 70.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
