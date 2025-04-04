import 'package:componentss/features/study/data/group_model.dart';
import 'package:componentss/features/study/data/tempGroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterviewSchedule extends StatelessWidget {
  final GroupModel group;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          CircleAvatar(radius: 70.r),
          SizedBox(height: 20),
          Text(
            "D-15",
            style: TextStyle(
              fontSize: 44.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Wanted sans",
            ),
          ),
          Text(
            "Groupname",
            style: TextStyle(fontSize: 36.sp, color: Color(0xFF6B6B6B)),
          ),
        ],
      ),
    );
  }
}
