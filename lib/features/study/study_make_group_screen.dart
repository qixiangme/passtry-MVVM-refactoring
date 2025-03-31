import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyMakeGroup extends StatefulWidget {
  const StudyMakeGroup({super.key});

  @override
  State<StudyMakeGroup> createState() => _StudyMakeGroupState();
}

class _StudyMakeGroupState extends State<StudyMakeGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 77.w),
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150.h),

                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // 이전 페이지로 이동
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 70.0,
              child: Center(
                child: FloatingActionButton(
                  onPressed: () {
                    print("다음으로");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
