import 'package:componentss/features/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyComplete extends StatelessWidget {
  const StudyComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(
                '면접 합격을 위한\n완벽한 준비를 마쳤어요',
                style: TextStyle(
                  color: const Color(0xFF1C1C1C) /* main-black */,
                  fontSize: 76.sp,
                  fontFamily: 'Wanted Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 13.0, top: 8),
              child: Text(
                "입력하신 정보들로 맞춤 퀘스트를 출제합니다!",
                style: TextStyle(
                  fontSize: 44.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8E95A2),
                ),
              ),
            ),
            SizedBox(height: 550),

            GestureDetector(
              onTap: () {},
              child: Center(
                child: Container(
                  width: 993.w,
                  height: 160.h,
                  decoration: BoxDecoration(
                    color: Color(0XFFFF9F1C),

                    borderRadius: BorderRadius.all(Radius.circular(33.r)),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(goToPage: 0),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "시작하기",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 50.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
