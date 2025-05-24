import 'package:componentss/features/study/data/group_model.dart';
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
          CircleAvatar(
            radius: 70.w, // CircleAvatar 크기 설정
            backgroundImage:
                group.imageUrl != null && group.imageUrl!.isNotEmpty
                    ? NetworkImage(group.imageUrl!) // 네트워크 이미지 설정
                    : null, // 이미지가 없을 경우 null
            backgroundColor: Colors.grey.shade200, // 기본 배경색 설정
          ),
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
            group.name,
            style: TextStyle(fontSize: 36.sp, color: Color(0xFF6B6B6B)),
          ),
        ],
      ),
    );
  }
}
