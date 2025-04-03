import 'package:componentss/features/study/group_detail/detail_home.dart';
import 'package:componentss/features/study/group_detail/detail_live.dart';
import 'package:componentss/features/study/group_detail/detail_ranking.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(),
      body: Column(
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(60.0), // 높이 설정
            child: Container(
              color: Colors.white,
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 0,
                currentIndex: _currentIndex, // 현재 선택된 탭 인덱스
                onTap: (index) {
                  setState(() {
                    _currentIndex = index; // 선택된 탭 인덱스 업데이트
                  });
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
                  BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: '설정',
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: _pages[_currentIndex]), // 선택된 탭에 따라 다른 화면 표시
        ],
      ),
    );
  }
}
