import 'package:componentss/features/study/data/group_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class RankingCard extends StatelessWidget {
  final Group group;
  const RankingCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 482.w,
      height: 190.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35.r),
        border: Border.all(color: Color(0XFFC4CAD4), width: 1.2),
      ),
      child: Text("data"), // 이미지 연결되면 설정할게요,,,
    );
  }
}
