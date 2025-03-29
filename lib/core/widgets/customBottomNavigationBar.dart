import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0; // _currentIndex를 State로 이동

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
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
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 탭 변경 시 _currentIndex 업데이트
          });
        },
      ),
    );
  }
}
