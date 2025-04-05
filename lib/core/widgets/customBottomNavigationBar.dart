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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // 그림자 색상 및 투명도
            spreadRadius: 4, // 그림자 퍼짐 정도
            blurRadius: 3, // 그림자 흐림 정도
            offset: Offset(0, 3), // 그림자 위치 (가로, 세로)
          ),
        ],
      ),
      child: SizedBox(
        height: 250.h,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,

          selectedItemColor: Color(0xffFF9F1C),
          currentIndex: widget.currentIndex,
          iconSize: 60.h,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyle(
            color: const Color(0xffC4CAD4),
            fontSize: 33.sp,
          ),
          selectedLabelStyle: const TextStyle(color: Color(0xffFF9F1C)),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(CustomIcon.study),
              ),
              label: '스터디',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(CustomIcon.baking),
              ),
              label: '베이킹',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(CustomIcon.search),
              ),
              label: '탐색',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(CustomIcon.my),
              ),
              label: '마이',
            ),
          ],
          elevation: 10.0,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
