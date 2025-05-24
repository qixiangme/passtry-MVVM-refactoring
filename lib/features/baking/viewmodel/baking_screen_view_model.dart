// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:componentss/core/user_model.dart';
import 'package:componentss/features/baking/data/answer/answer_api.dart';
import 'package:componentss/features/baking/data/attendacne/attendance_api.dart';
import 'package:componentss/features/baking/data/interview/interview_api.dart';
import 'package:componentss/features/baking/data/mission/mission_api.dart';
import 'package:componentss/features/baking/view/widget/AnimatedHalfCircleProgress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:componentss/features/baking/data/answer/answer.dart';
import 'package:componentss/features/baking/data/attendacne/attendance_model.dart';
import 'package:componentss/features/baking/data/interview/interview_model.dart';
import 'package:componentss/features/baking/data/mission/mission_response_model.dart';

class BakingScreenViewModel extends StateNotifier<BakingScreenState> {
  InterviewApi interviewApi;

  BakingScreenViewModel(this.interviewApi) : super(BakingScreenState.initial());

  Future<void> loadUserScore(User user) async {
    try {
      final score = await getTodayScore(user.id!); // 유저 ID로 점수 가져오기
      state.copyWith(
        userScore: score,
        isLoadingScore: false,
        progress: (state.userScore ?? 0) / 1000.0,
      );
    } catch (e) {
      print('❌ 유저 점수 로드 중 오류 발생: $e');
      state.copyWith(isLoadingScore: false); // 로딩 실패
    }
  }

  void toggleExpanded() {
    state.copyWith(isExpanded: !state.isExpanded);
  }

  void setIndex(int index) {
    state.copyWith(index: index);
  }

  Future<void> loadQnaItems(User user) async {
    try {
      String userId = user.id!; // 실제 userId로 대체
      final answers = await AnswerApi.fetchAnswersByUserId(userId);

      state.copyWith(qnaItems: answers, isLoadingQna: false);
    } catch (e) {
      print('❌ Qna 데이터를 가져오는 중 오류 발생: $e');
      state.copyWith(isLoadingQna: false);
    }
  }

  String getImageForScore(int score) {
    if (score < 2) {
      state.copyWith(titleText: "따끈따끈한 반죽", levelText: 'LV.0');
      return 'assets/icons/dough.png'; // 스코어가 100 미만일 때
    } else if (score < 100) {
      state.copyWith(titleText: "살짝 익은 스콘", levelText: 'LV.1');

      return 'assets/icons/bread.png'; // 스코어가 100 미만일 때
      // 스코어가 100 이상 500 미만일 때
    } else if (score < 300) {
      state.copyWith(titleText: "노릇노릇한 식빵", levelText: 'LV.2');

      return 'assets/icons/baguette.png'; // 스코어가 100 미만일 때
      // 스코어가 100 이상 500 미만일 때
    } else if (score < 500) {
      state.copyWith(titleText: "달콤한 케이크", levelText: 'LV.4');

      return 'assets/icons/croissant.png'; // 스코어가 100 미만일 때
      // 스코어가 100 이상 500 미만일 때
    } else {
      state.copyWith(titleText: "제빵의 달인인", levelText: 'LV.5');

      return 'assets/icons/bagel.png'; // 스코어가 100 미만일 때
      // 스코어가 500 이상일 때
    }
  }

  Future<void> loadInterviews(User user) async {
    try {
      // 인터뷰 데이터 가져오기
      final interviews = await InterviewApi.getInterviewsByUser(user.id!);

      state.copyWith(interviews: interviews);

      print("✅ 인터뷰 데이터 로드 성공: ${state.interviews.length}개");

      if (state.interviews.isNotEmpty) {
        await fetchDday(state.interviews.first.id!);
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
      state.copyWith(dday: dday, isLoadingDday: false);
    } catch (e) {
      print('❌ D-day 데이터 로드 중 오류 발생: $e');
      state.copyWith(isLoadingDday: false);
    }
  }

  Future<void> loadMissionAndAttendanceData(
    int interviewIndex,
    User user,
  ) async {
    try {
      // 인터뷰 리스트가 비어있지 않은지 확인
      if (state.interviews.isEmpty ||
          interviewIndex >= state.interviews.length) {
        print("🚨 유효하지 않은 인터뷰 인덱스: $interviewIndex");
        return;
      }

      // 선택된 인터뷰의 ID 가져오기
      final selectedInterviewId = state.interviews[interviewIndex].id!;
      print("📤 선택된 인터뷰 ID: $selectedInterviewId");

      // 미션 데이터와 출석 데이터를 병렬로 가져옴
      final missionResponseFuture = fetchNextMissions(
        user.id!,
        state.interviews[interviewIndex].id!,
      );
      final attendanceHistoryFuture = AttendanceApi().fetchAttendanceHistory(
        user.id!,
        state.interviews[interviewIndex].id!,
      );

      final results = await Future.wait([
        missionResponseFuture,
        attendanceHistoryFuture,
      ]);

      final missionResponse = results[0] as MissionResponse;
      final attendanceHistory = results[1] as List<Attendance>;

      // 출석 데이터와 미션 데이터를 매칭하여 Quest의 isCompleted 설정
      final attendance =
          attendanceHistory.isNotEmpty ? attendanceHistory.last : null;

      final List<Quest> dailyQuests = [];
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

      state.copyWith(
        dailyQuests: dailyQuests,
        missionResponse: missionResponse,
        attendanceHistory: attendanceHistory,
        isLoading: false,
      );
    } catch (error) {
      print("🚨 미션 또는 출석 데이터 로드 실패: $error");
      if (mounted) state.copyWith(isLoading: false);
    }
  }
}

class BakingScreenState {
  final String levelText;
  final String titleText;
  final int? userScore; // 유저의 점수
  final bool isLoadingScore; // 점수 로딩 상태
  final int index;
  final bool isExpanded;
  final List<Answer> qnaItems; // Qna 데이터 리스트
  final bool isLoadingQna; // Qna 로딩 상태
  final int? dday; // D-day 데이터를 저장할 변수
  final bool isLoadingDday; // D-day 데이터 로딩 상태
  final MissionResponse? missionResponse;
  final bool isLoading; // 로딩 상태를 관리
  final List<Quest> dailyQuests;
  final List<Attendance> attendanceHistory;
  final List<InterviewModel> interviews;
  final int currentLevel; // 현재 레벨 상태 변수
  final double progress;

  factory BakingScreenState.initial() {
    return BakingScreenState(
      levelText: 'levelText',
      titleText: 'titleText',
      userScore: 0,
      isLoadingScore: true,
      index: 0,
      isExpanded: false,
      qnaItems: [],
      isLoadingQna: true,
      dday: 0,
      isLoadingDday: true,
      missionResponse: null,
      isLoading: true,
      dailyQuests: [],
      attendanceHistory: [],
      interviews: [],
      currentLevel: 0,
      progress: 0,
    );
  }

  BakingScreenState({
    required this.levelText,
    required this.titleText,
    required this.userScore,
    required this.isLoadingScore,
    required this.index,
    required this.isExpanded,
    required this.qnaItems,
    required this.isLoadingQna,
    required this.dday,
    required this.isLoadingDday,
    required this.missionResponse,
    required this.isLoading,
    required this.dailyQuests,
    required this.attendanceHistory,
    required this.interviews,
    required this.currentLevel,
    required this.progress,
  }); // 진행 상태 변수

  BakingScreenState copyWith({
    String? levelText,
    String? titleText,
    int? userScore,
    bool? isLoadingScore,
    int? index,
    bool? isExpanded,
    List<Answer>? qnaItems,
    bool? isLoadingQna,
    int? dday,
    bool? isLoadingDday,
    MissionResponse? missionResponse,
    bool? isLoading,
    List<Quest>? dailyQuests,
    List<Attendance>? attendanceHistory,
    List<InterviewModel>? interviews,
    int? currentLevel,
    double? progress,
  }) {
    return BakingScreenState(
      levelText: levelText ?? this.levelText,
      titleText: titleText ?? this.titleText,
      userScore: userScore ?? this.userScore,
      isLoadingScore: isLoadingScore ?? this.isLoadingScore,
      index: index ?? this.index,
      isExpanded: isExpanded ?? this.isExpanded,
      qnaItems: qnaItems ?? this.qnaItems,
      isLoadingQna: isLoadingQna ?? this.isLoadingQna,
      dday: dday ?? this.dday,
      isLoadingDday: isLoadingDday ?? this.isLoadingDday,
      missionResponse: missionResponse ?? this.missionResponse,
      isLoading: isLoading ?? this.isLoading,
      dailyQuests: dailyQuests ?? this.dailyQuests,
      attendanceHistory: attendanceHistory ?? this.attendanceHistory,
      interviews: interviews ?? this.interviews,
      currentLevel: currentLevel ?? this.currentLevel,
      progress: progress ?? this.progress,
    );
  }
}

final BakingScreenViewModelProvider =
    StateNotifierProvider<BakingScreenViewModel, BakingScreenState>((ref) {
      return BakingScreenViewModel(InterviewApi());
    });
