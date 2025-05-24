import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton1 extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTap;

  const NextButton1({required this.isEnabled, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    Color bgColor = isEnabled ? Color(0xFFFF9F1C) : Colors.white;
    Color borderColor = isEnabled ? Colors.white : Color(0xFFFF9F1C);
    Color textColor = isEnabled ? Colors.white : Color(0xFFFF9F1C);

    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 993.w,
        height: 160.h,
        decoration: ShapeDecoration(
          color: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.75.w, color: borderColor),
            borderRadius: BorderRadius.circular(33.r),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          '다음',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 50.sp,
            fontFamily: 'Wanted Sans',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.50,
          ),
        ),
      ),
    );
  }
}
