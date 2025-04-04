import 'package:componentss/features/study/ui/group_detail/detail_home.dart';
import 'package:componentss/features/study/ui/group_detail/detail_live.dart';
import 'package:componentss/features/study/ui/group_detail/detail_ranking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupDetaill extends StatefulWidget {
  const GroupDetaill({super.key});

  @override
  State<GroupDetaill> createState() => _GroupDetaillState();
}

class _GroupDetaillState extends State<GroupDetaill> {
  int _currentIndex = 0; // 현재 선택된 탭 인덱스

  // 탭에 따라 다른 화면을 표시하기 위한 위젯 리스트
  final List<Widget> _pages = [DetailHome(), DetailLive(), DetailRanking()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 65),
            child: Text(
              "groupName",
              style: TextStyle(
                fontSize: 55.sp,
                fontFamily: "Wanted Sans",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(80.0), // 높이 설정
            child: Container(
              height: 50.0, // 원하는 높이 설정
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // 홈 버튼
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end, // 텍스트를 아래로 정렬
                        children: [
                          Text(
                            '홈',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color:
                                  _currentIndex == 0
                                      ? Colors.black
                                      : Color(0xFF6B6B6B),
                              fontSize: 50.0.sp, // 텍스트 크기
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 실시간 버튼
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end, // 텍스트를 아래로 정렬
                        children: [
                          // 아이콘과 텍스트 간격
                          Text(
                            '실시간',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,

                              color:
                                  _currentIndex == 1
                                      ? Colors.black
                                      : Color(0xFF6B6B6B),
                              fontSize: 50.sp, // 텍스트 크기
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 랭킹 버튼
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end, // 텍스트를 아래로 정렬
                        children: [
                          Text(
                            '랭킹',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,

                              color:
                                  _currentIndex == 2
                                      ? Colors.black
                                      : Color(0xFF6B6B6B),
                              fontSize: 50.sp, // 텍스트 크기
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: _pages[_currentIndex]), // 선택된 탭에 따라 다른 화면 표시
        ],
      ),
    );
  }
}
