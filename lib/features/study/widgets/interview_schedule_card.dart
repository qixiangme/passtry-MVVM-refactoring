import 'package:flutter/material.dart';
import 'package:componentss/features/study/data/group_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterviewSchedule extends StatelessWidget {
  final Group group;

  const InterviewSchedule({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317.w,
      height: 350.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5.r),
        border: Border.all(color: Color(0XFFC4CAD4)),
      ),
      child: Text("data"), // 이미지 연결되면 설정할게요,,,
    );
  }
}
