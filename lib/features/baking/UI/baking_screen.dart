import 'dart:math';

import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/baking/UI/baking_qnaList_screen.dart';
import 'package:componentss/features/baking/UI/baking_stage.dart';
import 'package:componentss/features/baking/UI/qna_list_model.dart';
import 'package:componentss/features/baking/UI/setting/study_make_screen.dart';
import 'package:componentss/features/baking/data/answer/answer.dart';
import 'package:componentss/features/baking/data/answer/answer_api.dart';
import 'package:componentss/features/baking/data/attendacne/attendance_api.dart';
import 'package:componentss/features/baking/data/attendacne/attendance_model.dart';
import 'package:componentss/features/baking/data/interview/interview_api.dart';
import 'package:componentss/features/baking/data/interview/interview_model.dart';
import 'package:componentss/features/baking/data/mission/mission_api.dart';
import 'package:componentss/features/baking/data/mission/mission_model.dart';
import 'package:componentss/features/baking/data/mission/mission_response_model.dart';
import 'package:componentss/features/baking/UI/questions/even/answer_screen.dart';
import 'package:componentss/features/baking/UI/questions/odd/odd_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class LevelInfo {
  final String badgeText;
  final String titleText;
  const LevelInfo({required this.badgeText, required this.titleText});
}

// --- 위에서 정의한 levelData 리스트 ---
final List<LevelInfo> levelData = [
  const LevelInfo(badgeText: 'Lv.0', titleText: '알 수 없음'), // 인덱스 0 (기본값)
  const LevelInfo(badgeText: 'Lv.1', titleText: '따끈따끈한 반죽'),
  const LevelInfo(badgeText: 'Lv.2', titleText: '살짝 익은 스콘'),
  const LevelInfo(badgeText: 'Lv.3', titleText: '노릇노릇한 식빵'),
  const LevelInfo(badgeText: 'Lv.4', titleText: '달콤한 케이크'),
  const LevelInfo(badgeText: 'Lv.5', titleText: '제빵의 달인'),
];

class BakingScreen extends StatefulWidget {
  const BakingScreen({super.key});

  @override
  State<BakingScreen> createState() => _BakingScreenState();
}

class _BakingScreenState extends State<BakingScreen> {
  int? userScore; // 유저의 점수
  bool isLoadingScore = true; // 점수 로딩 상태
  int index = 0;
  bool isExpanded = false;
  List<Answer> qnaItems = []; // Qna 데이터 리스트
  bool isLoadingQna = true; // Qna 로딩 상태
  int? _dday; // D-day 데이터를 저장할 변수
  bool isLoadingDday = true; // D-day 데이터 로딩 상태
  late MissionResponse? _missionResponse;
  bool _isLoading = true; // 로딩 상태를 관리
  final List<Quest> dailyQuests = [];
  late List<Attendance> _attendanceHistory;
  late List<InterviewModel> _interviews;
  final InterviewApi _interviewApi = InterviewApi();
  late int currentLevel; // 현재 레벨 상태 변수
  late double progress = 0.0; // 진행 상태 변수

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // UserProvider를 통해 사용자 정보 가져오기
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    if (user != null && _interviews.isNotEmpty) {
      // 첫 번째 인터뷰의 ID로 D-day 데이터 가져오기
      fetchDday(_interviews[index].id!);
    }
  }

  Future<void> _loadUserScore() async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;

      if (user != null) {
        final score = await getTodayScore(user.id!); // 유저 ID로 점수 가져오기
        setState(() {
          userScore = score; // 점수 상태에 저장
          isLoadingScore = false; // 로딩 완료
          progress = (userScore ?? 0) / 1000.0;
        });
      }
    } catch (e) {
      print('❌ 유저 점수 로드 중 오류 발생: $e');
      setState(() {
        isLoadingScore = false; // 로딩 실패
      });
    }
  }

  Future<void> _loadQnaItems() async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;

      String userId = user!.id!; // 실제 userId로 대체
      final answers = await AnswerApi.fetchAnswersByUserId(userId);

      setState(() {
        qnaItems = answers; // 데이터를 상태에 저장
        isLoadingQna = false; // 로딩 완료
      });
    } catch (e) {
      print('❌ Qna 데이터를 가져오는 중 오류 발생: $e');
      setState(() {
        isLoadingQna = false; // 로딩 실패
      });
    }
  }

  String getImageForScore(int score) {
    if (score < 2) {
      return 'assets/icons/dough.png'; // 스코어가 100 미만일 때
    } else if (score < 100) {
      return 'assets/icons/bread.png'; // 스코어가 100 미만일 때
      // 스코어가 100 이상 500 미만일 때
    } else if (score < 300) {
      return 'assets/icons/baguette.png'; // 스코어가 100 미만일 때
      // 스코어가 100 이상 500 미만일 때
    } else if (score < 500) {
      return 'assets/icons/croissant.png'; // 스코어가 100 미만일 때
      // 스코어가 100 이상 500 미만일 때
    } else {
      return 'assets/icons/bagel.png'; // 스코어가 100 미만일 때
      // 스코어가 500 이상일 때
    }
  }

  @override
  void initState() {
    super.initState();
    _interviews = [];
    _attendanceHistory = [];
    _loadInterviews().then((_) {
      if (_interviews.isNotEmpty) {
        _loadMissionAndAttendanceData(index); // 첫 번째 인터뷰 사용
      }
    });
    _loadQnaItems();
    _loadUserScore();
  }

  Future<void> _loadInterviews() async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;

      // 인터뷰 데이터 가져오기
      final interviews = await InterviewApi.getInterviewsByUser(user!.id!);

      setState(() {
        _interviews = interviews; // 인터뷰 데이터를 상태에 저장
      });

      print("✅ 인터뷰 데이터 로드 성공: ${_interviews.length}개");

      // 인터뷰 데이터 로드 후 첫 번째 인터뷰의 D-Day 호출
      if (_interviews.isNotEmpty) {
        await fetchDday(_interviews.first.id!);
      }
    } catch (error) {
      print("🚨 인터뷰 데이터 로드 실패: $error");
    }
  }

  Future<void> fetchDday(String interviewId) async {
    try {
      print("📤 D-Day 요청 시작: 인터뷰 ID = $interviewId");
      final int? dday = await InterviewApi.getInterviewDday(interviewId);
      print("📥 D-Day 응답: $dday");

      setState(() {
        _dday = dday;
        isLoadingDday = false;
      });
    } catch (e) {
      print('❌ D-day 데이터 로드 중 오류 발생: $e');
      setState(() {
        isLoadingDday = false;
      });
    }
  }

  Future<void> _loadMissionAndAttendanceData(int interviewIndex) async {
    try {
      // 인터뷰 리스트가 비어있지 않은지 확인
      if (_interviews.isEmpty || interviewIndex >= _interviews.length) {
        print("🚨 유효하지 않은 인터뷰 인덱스: $interviewIndex");
        return;
      }

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;

      // 선택된 인터뷰의 ID 가져오기
      final selectedInterviewId = _interviews[interviewIndex].id!;
      print("📤 선택된 인터뷰 ID: $selectedInterviewId");

      // 미션 데이터와 출석 데이터를 병렬로 가져옴
      final missionResponseFuture = fetchNextMissions(
        user!.id!,
        _interviews[interviewIndex].id!,
      );
      final attendanceHistoryFuture = AttendanceApi().fetchAttendanceHistory(
        user.id!,
        _interviews[interviewIndex].id!,
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

        dailyQuests.clear(); // 기존 퀘스트 초기화
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
      print("🚨 미션 또는 출석 데이터 로드 실패: $error");
      if (mounted)
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child:
                isLoadingScore
                    ? const CircularProgressIndicator() // 로딩 중
                    : Text(
                      '오늘의 점수: ${userScore ?? 0}', // 점수 표시
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
          ),
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
                  (context) => OddScreen(
                    mission: missionresponse.nextOddMission,
                    inteview: _interviews[index],
                  ),
            ),
          );
        } else if (quest.title == "랜덤질문에 답변 연습하기") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => AnswerScreen(
                    mission: missionresponse.nextEvenMission,
                    inteview: _interviews[index],
                  ),
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
                  //width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Text(
                          '패스츄리',
                          style: TextStyle(
                            fontSize: 66.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      Center(
                        child:
                            isLoadingDday || _interviews.isEmpty
                                ? const CircularProgressIndicator() // 로딩 중일 때 표시
                                : EventCard(
                                  title: _interviews[index].name, // 인터뷰 이름 표시
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
                          Center(
                            child: AnimatedHalfCircleProgress(
                              progress: progress,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 90),
                            child: Center(
                              child: Container(
                                width: 611.w,
                                height: 500.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      getImageForScore(userScore ?? 0),
                                    ), // AssetImage를 DecorationImage로 감쌈
                                    fit: BoxFit.cover, // 이미지 크기 조정
                                  ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return QnaListPage();
                                    },
                                  ),
                                );
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
                      isLoadingQna
                          ? const Center(
                            child: CircularProgressIndicator(),
                          ) // 로딩 중
                          : qnaItems.isEmpty
                          ? const Center(
                            child: Text(
                              '표시할 답변이 없습니다.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          )
                          : QnaListView(qnaItems: qnaItems),

                      //Padding(
                      //  padding: EdgeInsets.only(left: 20, right: 20),
                      //  child: Column(
                      //    children: [
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 인터뷰 버튼들 (애니메이션 적용)
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isExpanded ? 1.0 : 0.0,
            child: Column(
              children: List.generate(_interviews.length, (index) {
                final interview = _interviews[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: FloatingActionButton.extended(
                    heroTag: 'interview_$index',
                    backgroundColor: Colors.white,
                    icon: const Icon(Icons.person, color: Colors.orange),
                    label: Text(
                      interview.name, // 인터뷰 이름 표시
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        this.index = index; // 선택된 인터뷰의 인덱스를 업데이트
                      });
                      _loadMissionAndAttendanceData(index);
                      // 인터뷰 버튼 클릭 시 동작
                    },
                  ),
                );
              }),
            ),
          ),

          // 항상 표시되는 버튼
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: FloatingActionButton.extended(
                heroTag: 'always_visible',
                backgroundColor: Colors.orange,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  '새 인터뷰 만들기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  // StudyMake 화면으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudyMake()),
                  );
                },
              ),
            ),

          // 메인 플로팅 버튼 (토글 기능)
          FloatingActionButton(
            heroTag: 'main_fab',
            backgroundColor: Colors.orange,
            child: Icon(
              isExpanded ? Icons.close : Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded; // 버튼 확장/축소 상태 변경
              });
            },
          ),
        ],
      ),
    );
  }
}

class AnimatedHalfCircleProgress extends StatefulWidget {
  final double progress; // 진행률 (0.0 ~ 1.0)

  const AnimatedHalfCircleProgress({super.key, required this.progress});

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
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.progress,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedHalfCircleProgress oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 진행률이 변경되었을 때 애니메이션 업데이트
    if (oldWidget.progress != widget.progress) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.progress,
      ).animate(_controller);
      _controller.forward(from: 0.0);
    }
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
  final double progress; // 진행률 (0.0 ~ 1.0)

  HalfCircleProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint =
        Paint()
          ..color = const Color(0xFFD9D9D9)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Paint progressPaint =
        Paint()
          ..color = const Color(0xFFFF9F1C)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    // 배경 반원 그리기
    canvas.drawArc(rect, pi, pi, false, backgroundPaint);

    // 진행률에 따른 반원 그리기
    canvas.drawArc(rect, pi, pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
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

class EventCard extends StatelessWidget {
  final String title;

  const EventCard({super.key, required this.title});

  String calculateDday(DateTime target) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDay = DateTime(target.year, target.month, target.day);
    final difference = targetDay.difference(today).inDays;

    if (difference == 0) {
      return 'D-Day'; // D-Day는 특별 처리
    } else if (difference > 0) {
      return 'D - $difference';
    } else {
      return 'D + ${difference.abs()}';
    }
  }

  // D-day 문자열을 각 부분(문자)으로 분리하는 함수
  List<String> getDdayParts(String dDayString) {
    if (dDayString == 'D-Day') {
      return ['D', '-', '0'];
    } else {
      // "D - 123" 또는 "D + 45" 같은 형태 처리
      List<String> parts = [];
      parts.add('D'); // 첫 글자 'D'
      parts.add(dDayString.substring(2, 3)); // 부호 ('-' 또는 '+')
      String numberPart = dDayString.substring(4);
      parts.addAll(numberPart.split(''));
      return parts;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000.w,
      height: 250.h,

      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Color(0x21FF9F1C),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.orange, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4.0),
            ],
          ),
        ],
      ),
    );
  }
}
