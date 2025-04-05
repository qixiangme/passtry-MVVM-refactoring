import 'package:componentss/features/study/data/group_model.dart';
import 'package:componentss/features/study/ui/group_detail/detail_home.dart';
import 'package:componentss/features/study/ui/group_detail/detail_ranking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupDetaill extends StatefulWidget {
  final GroupModel groupModel;
  const GroupDetaill({super.key, required this.groupModel});

  @override
  State<GroupDetaill> createState() => _GroupDetaillState();
}

class _GroupDetaillState extends State<GroupDetaill> {
  int _currentIndex = 0; // 현재 선택된 탭 인덱스
  late List<Widget> _pages; // `late` 키워드로 선언
  // 탭에 따라 다른 화면을 표시하기 위한 위젯 리스트

  @override
  void initState() {
    super.initState();
    // `widget.groupModel`을 사용하여 `_pages` 초기화
    _pages = [DetailHome(groupModel: widget.groupModel)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 65),
            child: Text(
              widget.groupModel.name,
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

                    // 랭킹 버튼
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
