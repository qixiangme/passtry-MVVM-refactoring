import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: BottomNavigationBar(
        selectedItemColor: Color(0xffFF9F1C),
        currentIndex: widget.currentIndex,
        iconSize: 60.h,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
          color: const Color(0xffC4CAD4),
          fontSize: 33.sp,
        ),
        selectedLabelStyle: const TextStyle(color: Colors.orange),
        items: [
          BottomNavigationBarItem(icon: Icon(CustomIcon.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(CustomIcon.study), label: '스터디'),
          BottomNavigationBarItem(icon: Icon(CustomIcon.baking), label: '베이킹'),
          BottomNavigationBarItem(icon: Icon(CustomIcon.search), label: '탐색'),
          BottomNavigationBarItem(icon: Icon(CustomIcon.my), label: '마이'),
        ],
        onTap: widget.onTap,
      ),
    );
  }
}
