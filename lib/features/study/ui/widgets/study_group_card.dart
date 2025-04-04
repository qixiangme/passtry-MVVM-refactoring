import 'package:componentss/features/study/data/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyGroupCard extends StatelessWidget {
  final GroupModel group;

  const StudyGroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 482.w,
      height: 434.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35.r),
        border: Border.all(color: Color(0xFFECECEC), width: 2.75.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 255.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(35.r)),

              image:
                  group.imageUrl != null
                      ? DecorationImage(
                        image: NetworkImage(group.imageUrl!),
                        fit: BoxFit.cover,
                      )
                      : null,
            ),
          ),

          SizedBox(height: 1.0, child: Divider(color: Color(0xFFECECEC))),

          Padding(
            padding: EdgeInsets.all(30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  style: TextStyle(
                    fontSize: 41.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.calendar_today, color: Colors.black54, size: 18),
                    SizedBox(width: 5),
                    Text("멤버수"),
                    SizedBox(width: 15),
                    Icon(Icons.calendar_today, color: Colors.black54, size: 18),
                    SizedBox(width: 5),
                    Text("스터디 주제"),
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
