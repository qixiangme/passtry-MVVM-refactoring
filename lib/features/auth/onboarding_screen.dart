import 'package:componentss/features/auth/login_screen.dart';
import 'package:componentss/features/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 250.h),
          Positioned(
            left: 44.w,
            top: 342.h,
            child: Image.asset(
              'assets/icons/login.png',
              width: 992.w,
              height: 1360.h,
            ),
          ),
          SizedBox(height: 200.h),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
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
                    "로그인",
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
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: Center(
              child: Container(
                width: 993.w,
                height: 160.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0XFFFF9F1C)),
                  borderRadius: BorderRadius.all(Radius.circular(33.r)),
                ),
                child: Center(
                  child: Text(
                    "회원가입",
                    style: TextStyle(
                      color: Color(0XFFFF9F1C),
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
    );
  }
}
