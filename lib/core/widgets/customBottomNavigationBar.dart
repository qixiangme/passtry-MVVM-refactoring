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
        selectedItemColor: Colors.black,
        currentIndex: widget.currentIndex,
        iconSize: 66.h,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
          color: const Color(0xffC4CAD4),
          fontSize: 33.sp,
        ),
        selectedLabelStyle: const TextStyle(color: Colors.black),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.square), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.square), label: '스터디'),
          BottomNavigationBarItem(icon: Icon(Icons.square), label: '베이킹'),
          BottomNavigationBarItem(icon: Icon(Icons.square), label: '탐색'),
          BottomNavigationBarItem(icon: Icon(Icons.square), label: '마이'),
        ],
        onTap: widget.onTap,
      ),
    );
  }
}
