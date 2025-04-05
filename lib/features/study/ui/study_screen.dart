import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/study/data/group_api.dart';
import 'package:componentss/features/study/data/group_model.dart';
import 'package:componentss/features/study/ui/group_detail/group_detaill.dart';
import 'package:componentss/features/study/ui/search_group/search_group_screen.dart';
import 'package:componentss/features/study/ui/make_group/study_make_group_screen.dart';
import 'package:componentss/features/study/ui/widgets/interview_schedule_card.dart';
import 'package:componentss/features/study/ui/widgets/ranking_card.dart';
import 'package:componentss/features/study/ui/widgets/study_group_card.dart';
import 'package:componentss/features/study/ui/new_gruop/new_group_category_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  GroupApi groupApi = GroupApi();

  List<GroupModel> _studyGroups = []; // 스터디 그룹 목록
  bool isLoading = true; // 데이터 로딩 상태
  final bool _showButton = true;
  final bool _showAdditionalButtons = false; // 추가 버튼 표시 여부
  final double _lastOffset = 0;
  int score = 0; // 점수 초기화

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // UserProvider를 통해 사용자 정보 가져오기
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    if (user != null) {
      // 사용자 ID로 그룹 목록 가져오기
      fetchGroupsByUserId(user.id!);
    }
  }

  Future<void> fetchGroupsByUserId(String userId) async {
    try {
      final groups = await groupApi.getGroupsById(userId); // GroupApi 활용
      if (groups != null) {
        groups.sort((a, b) {
          int scoreA = a.score ?? 0; // null일 경우 0으로 처리 (예시)
          int scoreB = b.score ?? 0; // null일 경우 0으로 처리 (예시)
          return scoreB.compareTo(scoreA); // 내림차순 정렬 (b와 a의 위치를 바꾸면 오름차순)
        });

        setState(() {
          _studyGroups = groups;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load groups for user $userId');
      }
    } catch (e) {
      print("Error fetching groups for user $userId: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    if (user != null) {
      print("사용자 이름: ${user.username}");
    }
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
                          user != null ? "${user.username}님, 안녕하세요!" : "안녕하세요!",
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

                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 30),
                            child: SizedBox(
                              width: 1000.w,
                              child: Text(
                                "오늘도 함께\n면접 합격을 향해!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 150.h, // 텍스트보다 살짝 아래
                            left: 560.w, // 오른쪽으로 이동
                            child: Image.asset(
                              'assets/icons/cupcake.png',
                              width: 500.w,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 490.h),
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
                            "참여 중인 스터디",
                            style: TextStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: SizedBox(
                            height: 500.h, // 🟢 높이 제한 추가
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
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) => GroupDetaill(
                                                      groupModel:
                                                          _studyGroups[index],
                                                    ), // 그룹 상세 페이지로 이동
                                              ),
                                            );
                                          },
                                          child: StudyGroupCard(
                                            group: _studyGroups[index],
                                          ),
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
                              fontSize: 50.sp,
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
                              builder: (context) => SearchGroupScreen(),
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
                      child: Icon(
                        Icons.search,
                        color: Color(0xffFF9F1C),
                        size: 35,
                      ),
                      onPressed: () {
                        if (isExpanded) {
                          setState(() {
                            isExpanded = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchGroupScreen(),
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
                child:
                    isExpanded
                        ? Image.asset('assets/icons/close.png', width: 65.w)
                        : Image.asset('assets/icons/spatula.png', width: 66.w),

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
