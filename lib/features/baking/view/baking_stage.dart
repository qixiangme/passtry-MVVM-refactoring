import 'package:componentss/features/baking/view/baking_screen.dart';
import 'package:componentss/features/baking/data/mission/mission_model.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 각 동그라미의 위치 정보를 담는 클래스 (혹은 Map을 사용해도 됩니다)
class CirclePosition {
  final double left;
  final double top;
  final bool isUnlocked;

  const CirclePosition({
    required this.left,
    required this.top,
    required this.isUnlocked,
  });
}

class BakingStage extends StatefulWidget {
  const BakingStage({super.key});

  @override
  State<BakingStage> createState() => _BakingStageState();
}

class _BakingStageState extends State<BakingStage> {
  // 동그라미 위치 리스트
  List<CirclePosition> circlePositions = [
    CirclePosition(left: 446.w, top: 3067.h, isUnlocked: true), // 일곱 번째 동그라미

    CirclePosition(left: 770.w, top: 2760.h, isUnlocked: true), // 여섯 번째 동그라미

    CirclePosition(left: 446.w, top: 2435.h, isUnlocked: true), // 다섯 번째 동그라미
    CirclePosition(left: 75.w, top: 2123.h, isUnlocked: false), // 네 번째 동그라미
    CirclePosition(left: 446.w, top: 1780.h, isUnlocked: false), // 세 번째 동그라미
    CirclePosition(left: 446.w, top: 1780.h, isUnlocked: false), // 세 번째 동그라미
    CirclePosition(left: 446.w, top: 1780.h, isUnlocked: false), // 세 번째 동그라미
    CirclePosition(left: 765.w, top: 1470.h, isUnlocked: false), // 두 번째 동그라미
    CirclePosition(left: 446.w, top: 1150.h, isUnlocked: false), // 첫 번째 동그라미
  ];
  final List<Mission> stage1Missions = [
    Mission(
      id: "stage1_mission1",
      stage: 1,
      index: 1, // 첫 번째 미션
      question: "첫 번째 미션: 제시된 숫자 중 홀수만 골라보세요!",
      type: "ODD",
    ),
    Mission(
      id: "stage1_mission2",
      stage: 1,
      index: 2, // 두 번째 미션
      question: "두 번째 미션: 제시된 숫자 중 짝수만 골라보세요!",
      type: "EVEN",
    ),
    Mission(
      id: "stage1_mission3",
      stage: 1,
      index: 3, // 세 번째 미션
      question: "세 번째 미션: 홀수를 찾아주세요.",
      type: "ODD",
    ),
    Mission(
      id: "stage1_mission4",
      stage: 1,
      index: 4, // 네 번째 미션
      question: "네 번째 미션: 이번엔 짝수입니다!",
      type: "EVEN",
    ),
    Mission(
      id: "stage1_mission5",
      stage: 1,
      index: 5, // 다섯 번째 미션
      question: "다섯 번째 미션: 홀수 찾기 챌린지!",
      type: "ODD",
    ),
    Mission(
      id: "stage1_mission6",
      stage: 1,
      index: 6, // 여섯 번째 미션
      question: "여섯 번째 미션: 마지막 짝수 미션!",
      type: "EVEN",
    ),
    Mission(
      id: "stage1_mission7",
      stage: 1,
      index: 7, // 일곱 번째 미션 (마지막)
      question: "마지막 미션: 최종 홀수 판별!",
      type: "ODD",
    ),
  ];

  Future<void> _navigateToMission(int currentMissionIndex) async {
    // 유효한 인덱스인지 확인
    if (currentMissionIndex < 0 ||
        currentMissionIndex >= stage1Missions.length) {
      print("Error: Invalid mission index $currentMissionIndex");
      return;
    }

    Mission currentMission = stage1Missions[currentMissionIndex];
    bool? missionCompletedSuccessfully; // 결과는 bool? (null 가능)

    print(
      "Navigating to mission ${currentMission.index} (${currentMission.type})",
    );

    // 미션 타입에 따라 적절한 퀴즈 화면으로 이동하고 결과(bool?)를 기다림
    if (currentMission.type == "ODD") {
      missionCompletedSuccessfully = await Navigator.push<bool>(
        context,
        MaterialPageRoute(
          // OddQuiz는 성공 시 true, 실패/뒤로가기 시 false 또는 null 반환 가정
          builder: (context) => MainScreen(goToPage: 0),
        ),
      );
    } else if (currentMission.type == "EVEN") {
      missionCompletedSuccessfully = await Navigator.push<bool>(
        context,
        MaterialPageRoute(
          // AnswerScreen은 성공 시 true, 실패/뒤로가기 시 false 또는 null 반환 가정
          builder: (context) => MainScreen(goToPage: 0),
        ),
      );
    } else {
      print("Error: Unknown mission type: ${currentMission.type}");
      return;
    }

    // 미션 성공 여부 확인 (true일 때만 진행)
    if (missionCompletedSuccessfully == true) {
      print("Mission ${currentMission.index} completed successfully!");

      int nextMissionIndex = currentMissionIndex + 1; // 다음 미션의 리스트 인덱스

      // 다음 미션이 존재하는지 확인 (리스트 범위 내)
      if (nextMissionIndex < circlePositions.length) {
        // 다음 미션의 현재 CirclePosition 객체 가져오기
        CirclePosition currentNextPosition = circlePositions[nextMissionIndex];

        // 다음 미션이 아직 잠겨 있는지 확인
        if (!currentNextPosition.isUnlocked) {
          print(
            "Unlocking next mission: Index $nextMissionIndex (Mission ${nextMissionIndex + 1})",
          );

          // --- 중요: 새로운 CirclePosition 객체 생성 (isUnlocked: true) ---
          CirclePosition unlockedNextPosition = CirclePosition(
            left: currentNextPosition.left,
            top: currentNextPosition.top,
            isUnlocked: true, // 잠금 해제!
          );
          // ----------------------------------------------------------

          // setState를 호출하여 리스트를 업데이트하고 UI 갱신
          setState(() {
            circlePositions[nextMissionIndex] = unlockedNextPosition;
          });
        } else {
          print("Next mission (Index $nextMissionIndex) was already unlocked.");
        }
      } else {
        print("All missions completed!");
        // 모든 미션 완료 시 처리 (예: 스테이지 완료 화면 표시)
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('축하합니다! 모든 미션을 완료했습니다!')));
      }
    } else {
      // 사용자가 뒤로 가거나 미션에 실패한 경우
      print(
        "Mission ${currentMission.index} was not completed or user backed out.",
      );
    }
  }

  // 동그라미 위젯을 생성하는 함수
  Widget _buildCircleWidget(double left, double top, bool isUnlocked) {
    String imagePath =
        isUnlocked
            ? 'assets/icons/acorn.png' // 실제 잠금 해제 아이콘 경로로 변경하세요.
            : 'assets/icons/lock.png';

    Color circleColor =
        isUnlocked
            ? const Color(0xFFFDEEB2) // 잠금 해제 시 색상
            : const Color(0xFFD2D2D2); // 잠겨 있을 때 색상

    double iconWidth = isUnlocked ? 350.w : 74.w;
    double iconHeight = isUnlocked ? 350.h : 94.h;
    double iconLeft = isUnlocked ? (240.w - iconWidth) / 2 : 83.w;
    double iconTop = isUnlocked ? (240.h - iconHeight) / 2 : 73.h;

    // 현재 위젯에 해당하는 CirclePosition 객체의 인덱스를 찾습니다.
    // *** 오류 수정: CirclePosition 클래스 이름 대신 circlePositions 리스트 인스턴스에서 indexWhere 호출 ***
    int currentIndex = circlePositions.indexWhere(
      (info) => info.left == left && info.top == top,
    );
    // 인덱스를 찾지 못한 경우 (-1) 처리 (선택 사항)
    String stageNumberText =
        (currentIndex != -1) ? (currentIndex + 1).toString() : '?';

    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () {
          if (isUnlocked) {
            print(
              'Unlocked stage tapped! Index: $currentIndex (Mission ${currentIndex + 1})',
            );
            // _navigateToMission 함수 호출 (현재 리스트 인덱스 전달)
            _navigateToMission(currentIndex);
          } else {
            print('Locked stage tapped! Index: $currentIndex');
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('이 스테이지는 아직 잠겨 있습니다.')));
          }
        },
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 240.w,
              height: 240.h,
              decoration: ShapeDecoration(
                color: circleColor,
                shape: OvalBorder(),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 15.r,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            Positioned(
              left: iconLeft,
              top: iconTop,
              child: Image.asset(
                imagePath,
                width: iconWidth,
                height: iconHeight,
                errorBuilder: (context, error, stackTrace) {
                  print("Error loading image: $imagePath"); // 이미지 로딩 에러 로그 추가
                  print(error);
                  // 잠금 해제 아이콘 로드 실패 시 대체 아이콘 표시
                  return Icon(
                    isUnlocked
                        ? Icons.check_circle_outline
                        : Icons.lock, // 상태에 따른 대체 아이콘
                    size: 60.sp,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            // 잠금 해제된 경우 스테이지 번호 표시
            if (isUnlocked)
              Text(
                stageNumberText, // 수정된 stageNumberText 사용
                style: TextStyle(
                  fontSize: 60.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
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
        child: Container(
          width: 1080.w,
          height: 3623.h, // 전체 높이는 내용에 맞게 조정될 수 있습니다.
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // 배경색
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(color: const Color(0xFFE5E5E5)),
                ),
              ),
              // 오븐 이미지
              Positioned(
                top: 135.h,
                left: 44.w,
                child: Image.asset(
                  'assets/icons/oven.png',
                  width: 992.w,
                  height: 1092.h,
                ),
              ),
              // 스테이지 로드 이미지
              Positioned(
                left: 90.w,
                top: 1165.h,
                child: Image.asset(
                  'assets/images/StageRoad.png',
                  width: 900.w,
                  height: 2143.h,
                ),
              ),

              // --- 동그라미 위젯들을 리스트를 이용해 생성 ---
              ...circlePositions.map(
                (pos) => _buildCircleWidget(pos.left, pos.top, pos.isUnlocked),
              ),
              // -----------------------------------------

              // 도토리 이미지

              // 시작 버튼 이미지
              Positioned(
                left: 376.w,
                top: 3404.h, // 시작 버튼 위치는 동그라미와 별개로 유지
                child: Image.asset(
                  'assets/icons/start.png',
                  width: 367.w,
                  height: 82.h,
                ),
              ),
              // 상단 흰색 배경
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 1080.w, // ScreenUtil 적용
                  height: 110.h, // ScreenUtil 적용
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              // 스테이지 텍스트
              Positioned(
                top: 135.h, // 텍스트 위치 조정 필요 시 수정
                left: 0, // 좌우 정렬을 위해 left 추가
                right: 0, // 좌우 정렬을 위해 right 추가
                child: Container(
                  width: 1080.w,
                  height: 120.h,
                  // 높이 조절 가능
                  padding: EdgeInsets.only(left: 5.w, right: 28.w),
                  // ScreenUtil 적용
                  child: Row(
                    // mainAxisSize 제거, Row가 전체 너비를 차지하도록 함
                    mainAxisAlignment: MainAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox 제거 또는 width 조정
                      Padding(
                        // 왼쪽 여백 추가
                        padding: EdgeInsets.only(left: 40.w), // 원하는 만큼 여백 설정
                        child: Text(
                          'STAGE 1',
                          style: TextStyle(
                            color: const Color(0xFF1C1C1C),
                            fontSize: 60.sp,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.60.sp, // ScreenUtil 적용
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
      ),
    );
  }
}
