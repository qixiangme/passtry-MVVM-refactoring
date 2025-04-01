import 'package:componentss/features/study/data/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyGroupCard extends StatelessWidget {
  final Group group;

  const StudyGroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 482.w,
      height: 434.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Color(0XFFC4CAD4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 233.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
              color: Colors.blueAccent,
              image:
                  group.imageUrl.isNotEmpty
                      ? DecorationImage(
                        image: NetworkImage(group.imageUrl),
                        fit: BoxFit.cover,
                      )
                      : null,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  style: TextStyle(
                    fontSize: 44.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.calendar_today, color: Colors.black54),
                    Text(group.memberCount),
                    SizedBox(width: 10),
                    Icon(Icons.calendar_today, color: Colors.black54),
                    Text(group.memberCount),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
