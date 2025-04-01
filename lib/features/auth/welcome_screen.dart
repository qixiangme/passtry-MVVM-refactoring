import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                'Username 님, 환영합니다!',
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
                "함께 면접 준비 시작해 볼까요?",
                style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),
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
          ],
        ),
      ),
    );
  }
}
