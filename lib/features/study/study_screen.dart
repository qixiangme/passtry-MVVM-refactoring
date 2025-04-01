import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Group {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String meetingInfo;
  final String memberCount;

  Group({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.meetingInfo,
    required this.memberCount,
  });
}

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
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
      appBar: AppBar(
        title: Text("스터디", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF6B6B6B),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
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
                SizedBox(height: 20),
                Text("모시기모시기"),
                Text("모시기모시기"),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(38.5.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "참여중인 스터디",
                            style: TextStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: 460.h,
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
                                      height: 150.h, // 카드 높이에 맞게 설정
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _studyGroups.length,
                                        itemBuilder: (context, index) {
                                          return StudyGroupCard(
                                            group: _studyGroups[index],
                                          );
                                        },
                                      ),
                                    ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "스터디 랭킹",
                            style: TextStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: 460.h,
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
                                      height: 40.h, // 카드 높이에 맞게 설정
                                      child: ListView.builder(
                                        itemCount: _studyGroups.length,
                                        itemBuilder: (context, index) {
                                          return RankingCard(
                                            group: _studyGroups[index],
                                          );
                                        },
                                      ),
                                    ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "다가오는 면접 일정",
                            style: TextStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),

                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: 460.h,
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
                                      height: 40.h, // 카드 높이에 맞게 설정
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _studyGroups.length,
                                        itemBuilder: (context, index) {
                                          return RankingCard(
                                            group: _studyGroups[index],
                                          );
                                        },
                                      ),
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StudyGroupCard extends StatelessWidget {
  final Group group;

  const StudyGroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 482.w,
      height: 434.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Color(0XFFC4CAD4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 233.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
              color: Colors.blueAccent,
              image:
                  group.imageUrl.isNotEmpty
                      ? DecorationImage(
                        image: NetworkImage(group.imageUrl),
                        fit: BoxFit.cover,
                      )
                      : null,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  style: TextStyle(
                    fontSize: 44.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.calendar_today, color: Colors.black54),
                    Text(group.memberCount),
                    SizedBox(width: 10),
                    Icon(Icons.calendar_today, color: Colors.black54),
                    Text(group.memberCount),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RankingCard extends StatelessWidget {
  final Group group;

  const RankingCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 482.w,
      height: 210.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Color(0XFFC4CAD4)),
      ),
      child: Text("data"), // 이미지 연결되면 설정할게요,,,
    );
  }
}

class InterviewSchedule extends StatelessWidget {
  final Group group;

  const InterviewSchedule({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 302.w,
      height: 210.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Color(0XFFC4CAD4)),
      ),
      child: Text("data"), // 이미지 연결되면 설정할게요,,,
    );
  }
}
