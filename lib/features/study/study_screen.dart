import 'package:componentss/features/study/search_group_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentss/features/study/study_make_group_screen.dart';

class Group {
  final String id;
  final String name;
  final String description; // 예: '학술 분야, 연합동아리, 난이도 중, 최근 트렌드 포함'
  final String imageUrl; // 그룹 대표 이미지 URL
  final String meetingInfo; // 예: '4/5' (진행 횟수/총 횟수 등)
  final String memberCount; // 예: '6명'

  Group({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.meetingInfo,
    required this.memberCount,
  });

  // JSON 변환 로직이 필요
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2400),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Study Group List',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Wanted Sans',
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                fontFamily: 'Wanted Sans',
                color: Color(0xFF353C49),
              ),
              titleLarge: TextStyle(
                fontSize: 44.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xFF353C49),
              ),
            ),
          ),
          home: StudyScreen(),
        );
      },
    );
  }
}

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  // 서버 데이터 예시.
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

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // 화면 전체 패딩 적용
        padding: EdgeInsets.symmetric(horizontal: 77.w),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150.h),
                Row(
                  children: [
                    Text('스터디', style: Theme.of(context).textTheme.titleLarge),
                    Spacer(),
                    SizedBox(
                      width: 55.w,
                      height: 54.h,
                      child: Image.asset(
                        excludeFromSemantics: true,
                        'assets/icons/cup_star.png',
                        errorBuilder:
                            (context, error, stackTrace) => Icon(
                              Icons.star_border,
                              size: 50.sp,
                            ), // 에러 시 대체 아이콘
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),

                Expanded(
                  child:
                      _studyGroups.isEmpty
                          ? Center(
                            // 데이터 없을 때 표시
                            child: Text(
                              '참여 가능한 스터디가 없습니다.',
                              style: TextStyle(
                                fontSize: 35.sp,
                                color: Colors.grey,
                              ),
                            ),
                          )
                          : ListView.builder(
                            itemCount: _studyGroups.length,
                            itemBuilder: (context, index) {
                              // 각 그룹 데이터를 StudyGroupCard에 전달
                              return Padding(
                                padding: EdgeInsets.only(bottom: 40.h),
                                child: StudyGroupCard(
                                  group: _studyGroups[index],
                                ),
                              );
                            },
                          ),
                ),
              ],
            ),
            Positioned(
              right: 5.0,
              bottom: 70.0,

              child: FloatingActionButton(
                heroTag: null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70.r),
                ),

                backgroundColor: Colors.grey[700],
                child: Image.asset(
                  excludeFromSemantics: true,
                  height: 80.h,
                  width: 80.w,
                  'assets/icons/search.png',
                ),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
            ),

            Positioned(
              right: 5.0,
              bottom: 70.0,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: isExpanded ? 1.0 : 0.0,

                child: Column(
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.r),
                      ),

                      backgroundColor: Colors.grey[900],
                      child: Image.asset(
                        excludeFromSemantics: true,
                        height: 80.h,
                        width: 80.w,
                        'assets/icons/plus.png',
                      ),
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudyMakeGroup(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      heroTag: null,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.r),
                      ),

                      backgroundColor: Colors.grey[900],
                      child: Image.asset(
                        excludeFromSemantics: true,
                        height: 80.h,
                        width: 80.w,
                        'assets/icons/search.png',
                      ),
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchGroupScreen(),
                            ),
                          );
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.r),
                      ),

                      backgroundColor: Colors.grey[900],
                      child: Image.asset(
                        excludeFromSemantics: true,

                        height: 80.h,
                        width: 80.w,
                        'assets/icons/plus.png',
                      ),
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    ),
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

// 스터디 그룹 정보를 표시하는 카드 위젯
class StudyGroupCard extends StatelessWidget {
  final Group group;

  const StudyGroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 카드 클릭 시 동작
        print('Group ${group.id} clicked!');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => StudyDetailPage(groupId: group.id)));
      },
      borderRadius: BorderRadius.circular(38.50.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.w, color: const Color(0xFFD8DCE2)),
            borderRadius: BorderRadius.circular(38.50.r),
          ),
          shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.name,
                        style: TextStyle(
                          color: const Color(0xFF1C1C1C),
                          fontSize: 44.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.44.w,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        group.description,
                        style: TextStyle(
                          color: const Color(0xFF6B6B6B),
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.4,

                          letterSpacing: -0.35.w,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 30.w),

                Container(
                  width: 150.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8DCE2),
                    borderRadius: BorderRadius.circular(75.r),
                    // image: DecorationImage(
                    //   image: NetworkImage(group.imageUrl),
                    //   fit: BoxFit.cover,
                    //   onError: (exception, stackTrace) {},
                    // ),
                  ),
                  // child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(75.r),
                  //   child: Image.network(
                  //     group.imageUrl,
                  //     fit: BoxFit.cover,
                  //     errorBuilder: (context, error, stackTrace) {
                  //       return Icon(
                  //         Icons.group,
                  //         size: 80.sp,
                  //         color: Colors.grey[400],
                  //       );
                  //     },
                  //     loadingBuilder: (context, child, loadingProgress) {
                  //       if (loadingProgress == null) return child;
                  //       return Center(
                  //         child: CircularProgressIndicator(
                  //           strokeWidth: 2.w,
                  //           valueColor: AlwaysStoppedAnimation<Color>(
                  //             Colors.grey[300]!,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Divider(color: Color(0xFFEAEAEA), thickness: 1.5.h),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  _buildInfoItem(
                    iconPath: 'assets/icons/calendar.png',
                    iconAlt: Icons.calendar_today_outlined,
                    text: group.meetingInfo,
                  ),
                  SizedBox(width: 100.w),
                  _buildInfoItem(
                    iconPath: 'assets/icons/small_man.png',
                    iconAlt: Icons.group_outlined,
                    text: group.memberCount,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required String iconPath,
    required IconData iconAlt,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 45.w,
          height: 45.h,
          child: Image.asset(
            excludeFromSemantics: true,
            iconPath,
            errorBuilder:
                (context, error, stackTrace) =>
                    Icon(iconAlt, size: 40.sp, color: Color(0xFF6B6B6B)),
          ),
        ),
        SizedBox(width: 20.w),
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF6B6B6B),
            fontSize: 36.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
