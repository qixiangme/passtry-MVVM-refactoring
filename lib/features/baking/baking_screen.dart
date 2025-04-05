import 'dart:math';

import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/baking/data/attendance_api.dart';
import 'package:componentss/features/baking/data/attendance_model.dart';
import 'package:componentss/features/baking/data/mission_api.dart';
import 'package:componentss/features/baking/data/mission_model.dart';
import 'package:componentss/features/baking/data/mission_response_model.dart';
import 'package:componentss/features/baking/questions/even/answer_screen.dart';
import 'package:componentss/features/baking/questions/odd/odd_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BakingScreen extends StatefulWidget {
  const BakingScreen({super.key});

  @override
  State<BakingScreen> createState() => _BakingScreenState();
}

class _BakingScreenState extends State<BakingScreen> {
  late MissionResponse? _missionResponse;
  bool _isLoading = true; // 로딩 상태를 관리
  final List<Quest> dailyQuests = [];
  late List<Attendance> _attendanceHistory;

  @override
  void initState() {
    super.initState();
    // _loadMissionData();
    _attendanceHistory = []; // 초기화
    _loadMissionAndAttendanceData(); // 미션과
    // 유저 ID를 사용하여 미션 데이터를 가져옵니다.
  }

  Future<void> _loadMissionAndAttendanceData() async {
    try {
      // 미션 데이터와 출석 데이터를 병렬로 가져옴
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;
      final missionResponseFuture = fetchNextMissions(
        user!.username,
      ); // 유저 ID를 실제 값으로 대체
      final attendanceHistoryFuture = AttendanceApi().fetchAttendanceHistory(
        user.username,
      );

      final results = await Future.wait([
        missionResponseFuture,
        attendanceHistoryFuture,
      ]);

      final missionResponse = results[0] as MissionResponse;
      final attendanceHistory = results[1] as List<Attendance>;

      setState(() {
        _missionResponse = missionResponse;
        _attendanceHistory = attendanceHistory;
        _isLoading = false;

        // 출석 데이터와 미션 데이터를 매칭하여 Quest의 isCompleted 설정
        final attendance =
            attendanceHistory.isNotEmpty ? attendanceHistory.last : null;

        dailyQuests.add(
          Quest(
            title: "모범답안 작성하기",
            subtitle: missionResponse.nextOddMission.question,
            stage:
                "Stage ${missionResponse.nextOddMission.stage}-${missionResponse.nextOddMission.index}",
            isCompleted: attendance?.oddMissionCompleted ?? false,
          ),
        );

        dailyQuests.add(
          Quest(
            title: "랜덤질문에 답변 연습하기",
            subtitle:
                attendance!.evenMissionCompleted
                    ? missionResponse.nextEvenMission.question
                    : "",
            stage:
                "Stage ${missionResponse.nextEvenMission.stage}-${missionResponse.nextEvenMission.index}",
            isCompleted: attendance.evenMissionCompleted,
          ),
        );
      });
    } catch (error) {
      print("Error loading mission or attendance data: $error");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildAttendanceSection() {
    // 요일 이름과 날짜를 매핑
    List<String> days = ['월', '화', '수', '목', '금', '토', '일'];
    DateTime startOfWeek = DateTime.now().subtract(
      Duration(days: DateTime.now().weekday - 1),
    );

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1000.w,
            height: 300.h,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD9D9D9)),
              borderRadius: BorderRadius.circular(38.50.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) {
                // 현재 주의 날짜 계산
                DateTime currentDate = startOfWeek.add(Duration(days: index));
                String formattedDate =
                    currentDate.toIso8601String().split('T').first;

                // 출석 여부 확인
                bool isAttended = _attendanceHistory.any(
                  (attendance) =>
                      attendance.attendanceSatisfied &&
                      attendance.date == formattedDate,
                );

                bool isToday =
                    currentDate.day == DateTime.now().day &&
                    currentDate.month == DateTime.now().month &&
                    currentDate.year == DateTime.now().year;

                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      isToday
                          ? Text(
                            days[index], // 요일 표시
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                          : Text(
                            days[index], // 요일 표시
                            style: TextStyle(
                              color: Color(0xFF6B6B6B),
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                      SizedBox(height: 10),
                      Container(
                        width: 100.w,
                        height: 100.h,
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                          color:
                              isAttended ? Colors.orange : Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            isAttended ? Icons.check : null,
                            color: Colors.white,
                            // 출석 여부 표시
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestItem(Quest quest, MissionResponse missionresponse) {
    return GestureDetector(
      onTap: () {
        if (quest.title == "모범답안 작성하기") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      AnswerScreen(mission: missionresponse.nextOddMission),
            ),
          );
        } else if (quest.title == "랜덤질문에 답변 연습하기") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      OddScreen(mission: missionresponse.nextEvenMission),
            ),
          );
          // 다른 퀘스트에 대한 동작 추가
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        width: 1000.w,
        decoration: BoxDecoration(
          color: quest.isCompleted ? const Color(0x21FF9F1C) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: quest.isCompleted ? Colors.orange : Colors.grey.shade300,
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quest 객체의 데이터를 사용
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: quest.isCompleted ? Colors.orange : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                quest.stage,
                style: TextStyle(
                  fontSize: 10,
                  color:
                      quest.isCompleted ? Colors.white : Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),
            Text(
              quest.title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            Divider(
              color: quest.isCompleted ? Colors.orange : Colors.grey.shade400,
              thickness: 1.0,
              indent: 0.5,
              endIndent: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  quest.subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),

                ElevatedButton(
                  onPressed: () {
                    print("object");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        quest.isCompleted
                            ? Colors.orange
                            : Colors.grey.shade800,

                    elevation: 0,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(65, 30),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    visualDensity: VisualDensity.compact,
                  ),

                  child: Text(
                    quest.isCompleted ? '완료' : '바로가기',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      Text('logo'),
                      Center(
                        child: Container(
                          width: 1000.w,
                          height: 200.h,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0x21FF9F1C), // 주황색
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2.96.w,
                                color: const Color(
                                  0xFFFF9F1C,
                                ) /* main-orange */,
                              ),
                              borderRadius: BorderRadius.circular(29.57.w),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 29.57.w,
                            children: [
                              Text(
                                '동아리 면접',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 36.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            width: 130.w,
                            height: 154.h,
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.r),
                            ),
                          ),

                          Container(
                            width: 130.w,
                            height: 154.h,
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.r),
                            ),
                          ),

                          Container(
                            width: 130.w,
                            height: 154.h,
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.r),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Center(child: AnimatedHalfCircleProgress()),
                          Padding(
                            padding: EdgeInsets.only(top: 90),
                            child: Center(
                              child: Container(
                                width: 611.w,
                                height: 500.h,
                                decoration: BoxDecoration(
                                  color: Color(0XFF6B6B6B),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0x21FF9F1C),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2.96.w,
                                color: const Color(
                                  0xFFFF9F1C,
                                ) /* main-orange */,
                              ),
                              borderRadius: BorderRadius.circular(29.57.w),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 29.57.w,
                            children: [
                              Text(
                                'Lv.0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(
                                    0xFFFF9F1C,
                                  ) /* main-orange */,
                                  fontSize: 36.w,
                                  fontFamily: 'Wanted Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Center(
                        child: Text(
                          '따끈따끈한 반죽',
                          style: TextStyle(
                            color: Colors.black /* white */,
                            fontSize: 66.w,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 200.h),

                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          '이번 주 출석 현황',
                          style: TextStyle(
                            color: Colors.black /* white */,
                            fontSize: 50.w,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildAttendanceSection(),

                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          '일일 퀘스트',
                          style: TextStyle(
                            color: Colors.black /* white */,
                            fontSize: 50.w,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          // map을 사용하여 각 Quest 객체를 _buildQuestItem 위젯으로 변환
                          // .toList()로 위젯 리스트 생성
                          children:
                              dailyQuests
                                  .map(
                                    (quest) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10.0,
                                      ),
                                      child: _buildQuestItem(
                                        quest,
                                        _missionResponse!,
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '나만의 모범 답안',
                              style: TextStyle(
                                color: Colors.black /* white */,
                                fontSize: 50.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //Navigator.push(
                                //  context,
                                //  MaterialPageRoute(
                                //    builder: (context) {}
                              },
                              child: Row(
                                children: [
                                  const Text('전체보기'),
                                  Icon(Icons.arrow_forward_ios, size: 15),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      //Padding(
                      //  padding: EdgeInsets.only(left: 20, right: 20),
                      //  child: Column(
                      //    children: [
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedHalfCircleProgress extends StatefulWidget {
  const AnimatedHalfCircleProgress({super.key});

  @override
  _AnimatedHalfCircleProgressState createState() =>
      _AnimatedHalfCircleProgressState();
}

class _AnimatedHalfCircleProgressState extends State<AnimatedHalfCircleProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 0, end: 0.5).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(900.w, 450.h),
          painter: HalfCircleProgressPainter(progress: _animation.value),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HalfCircleProgressPainter extends CustomPainter {
  final double progress;

  HalfCircleProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint =
        Paint()
          ..color = Color(0xFFD9D9D9)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Paint progressPaint =
        Paint()
          ..color = Color(0xFFFF9F1C)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    canvas.drawArc(rect, pi, pi, false, backgroundPaint);
    canvas.drawArc(rect, pi, pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Quest {
  final String title;
  final String subtitle;
  final String stage;
  final bool isCompleted;

  Quest({
    required this.title,
    required this.subtitle,
    required this.stage,
    required this.isCompleted,
  });
}
