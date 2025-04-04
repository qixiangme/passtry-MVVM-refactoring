import 'package:componentss/features/study/data/tempGroup.dart';
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
      child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // 가로 정렬 (중앙 정렬)
          crossAxisAlignment: CrossAxisAlignment.center, // 세로 정렬 (중앙 정렬)
          children: [
            Icon(
              Icons.emoji_events,
              size: 100.w,
              color: Colors.amber,
            ), // 트로피 아이콘
            SizedBox(width: 19.w), // 간격 조정
            CircleAvatar(),
            SizedBox(width: 30.w), // 간격 조정
            Text(
              group.name, // 그룹 이름
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
