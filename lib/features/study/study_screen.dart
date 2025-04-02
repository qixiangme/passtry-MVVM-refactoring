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

class _StudyScreenState extends State<StudyScreen> {
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
      backgroundColor: Color(0xFF6B6B6B),
      appBar: AppBar(
        title: Text(
          "스터디",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF6B6B6B),
      ),
      body: SingleChildScrollView(
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
                  Center(
                    child: Container(
                      width: 992.w,
                      height: 112.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(child: Text("알림")),
                    ),
                  ),
                  Text("모시기모시기", style: TextStyle(color: Colors.white)),
                  Text("응원의 모시기멘트멘트", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 160),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 21),
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
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "스터디 랭킹",
                        style: TextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 400.h, // 🟢 높이 제한 추가
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
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
    );
  }
}
