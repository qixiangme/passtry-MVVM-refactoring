import 'package:componentss/features/study/data/group_model.dart';
import 'package:componentss/features/study/search_group_screen.dart';
import 'package:componentss/features/study/study_make_group_screen.dart';
import 'package:componentss/features/study/widgets/interview_schedule_card.dart';
import 'package:componentss/features/study/widgets/ranking_card.dart';
import 'package:componentss/features/study/widgets/study_group_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _showButton = true;
  final bool _showAdditionalButtons = false; // 추가 버튼 표시 여부
  double _lastOffset = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double currentOffset = _scrollController.offset;
    if (currentOffset > _lastOffset && currentOffset > 50) {
      // 아래로 스크롤 시 버튼 숨김 (50px 이상 스크롤해야 적용)
      if (_showButton) {
        setState(() {
          _showButton = false;
        });
      }
    } else if (currentOffset < _lastOffset) {
      // 위로 스크롤 시 버튼 다시 표시
      if (!_showButton) {
        setState(() {
          _showButton = true;
        });
      }
    }
    _lastOffset = currentOffset; // 현재 스크롤 위치 저장
  }

  bool isExpanded = false;
  final List<Group> _studyGroups = [
    Group(
      id: '1',
      name: 'AI 트렌드 스터디',
      description: '머신러닝, 딥러닝 최신 논문 리뷰',
      imageUrl: '',
      meetingInfo: '3/8',
      memberCount: '5명',
    ),
    Group(
      id: '2',
      name: 'Flutter 앱 개발',
      description: '실전 앱 출시 목표 스터디',
      imageUrl: '',
      meetingInfo: '5/10',
      memberCount: '8명',
    ),
    Group(
      id: '3',
      name: 'UX/UI 디자인 워크샵',
      description: '피그마 활용, 프로토타이핑 실습',
      imageUrl: '',
      meetingInfo: '매주 토',
      memberCount: '6명',
    ),
    Group(
      id: '4',
      name: '코딩 테스트 준비반',
      description: '알고리즘 문제 풀이 및 코드 리뷰',
      imageUrl: '',
      meetingInfo: '주 2회',
      memberCount: '10명',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF6B6B6B), toolbarHeight: 1),
      backgroundColor: Color(0xFF6B6B6B),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            // 🟢 추가
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xFF6B6B6B)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          "스터디",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Center(
                          child: Container(
                            width: 992.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.35),
                              borderRadius: BorderRadius.circular(35.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "알림",
                                    style: TextStyle(
                                      color: Color(0xffFF9F1C),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 23),
                                  Text(
                                    "실시간 멤버들의 현황을 확인할 수 있는 텍스트입니다.",
                                    style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 30),
                        child: SizedBox(
                          width: 1000,
                          child: Text(
                            "모시기모시기\n응원의 모시기멘트",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                      SizedBox(height: 180),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(left: 26),
                          child: Text(
                            "참여중인 스터디",
                            style: TextStyle(
                              fontSize: 45.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 454.h, // 🟢 높이 제한 추가
                            child:
                                _studyGroups.isEmpty
                                    ? Center(
                                      child: Text(
                                        '참여 가능한 스터디가 없습니다.',
                                        style: TextStyle(
                                          fontSize: 35.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                    : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _studyGroups.length,
                                      shrinkWrap: true, // 🟢 크기 제한
                                      itemBuilder: (context, index) {
                                        return StudyGroupCard(
                                          group: _studyGroups[index],
                                        );
                                      },
                                    ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 26),
                          child: Text(
                            "스터디 랭킹",
                            style: TextStyle(
                              fontSize: 45.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 410.h, // 🟢 높이 제한 추가
                            child: ListView.builder(
                              itemCount: _studyGroups.length,
                              shrinkWrap: true, // 🟢 크기 제한
                              itemBuilder: (context, index) {
                                return RankingCard(group: _studyGroups[index]);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "다가오는 면접 일정",
                            style: TextStyle(
                              fontSize: 45.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(left: 11, right: 20),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: 380.h,
                            child:
                                _studyGroups.isEmpty
                                    ? Center(
                                      child: Text(
                                        '참여 가능한 스터디가 없습니다.',
                                        style: TextStyle(
                                          fontSize: 35.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                    : SizedBox(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _studyGroups.length,
                                        itemBuilder: (context, index) {
                                          return InterviewSchedule(
                                            group: _studyGroups[index],
                                          );
                                        },
                                      ),
                                    ),
                          ),
                        ),
                        SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (isExpanded)
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = false; // 배경을 클릭하면 닫힘
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.7), // 반투명 검정색 배경
                width: double.infinity,
                height: double.infinity,
              ),
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 추가 버튼들 (애니메이션 적용)
          AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: isExpanded ? 1.0 : 0.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (isExpanded)
                      Text(
                        "그룹 만들기",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 44.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    SizedBox(width: 15),
                    FloatingActionButton(
                      elevation: 0,
                      heroTag: 'create_group',
                      backgroundColor: Colors.white,
                      shape: CircleBorder(),
                      child: Icon(Icons.group_add, color: Color(0xffFF9F1C)),
                      onPressed: () {
                        if (isExpanded) {
                          setState(() {
                            isExpanded = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudyMakeGroup(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "그룹 찾기",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 44.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 15),

                    FloatingActionButton(
                      elevation: 0,
                      heroTag: 'search_group',
                      backgroundColor: Colors.white,
                      shape: CircleBorder(),
                      child: Icon(Icons.search, color: Color(0xffFF9F1C)),
                      onPressed: () {
                        if (isExpanded) {
                          setState(() {
                            isExpanded = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudyMakeGroup(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),

          // 메인 플로팅 버튼 (토글 기능)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                elevation: 0,
                heroTag: 'main_fab',
                backgroundColor: Color(0xffFF9F1C),
                shape: CircleBorder(),
                child: Icon(
                  isExpanded ? Icons.close : Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
