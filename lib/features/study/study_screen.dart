import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.all(44.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100.h),
                    Text(
                      '스터디',
                      style: TextStyle(
                        color: const Color(0xFF353C49),
                        fontSize: 44.sp,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.44.w,
                      ),
                    ),
                  ]
              )
          )
      ),
    );
  }
}

