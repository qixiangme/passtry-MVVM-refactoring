import 'dart:async';

import 'package:componentss/features/baking/baking_screen.dart';
import 'package:componentss/features/baking/questions/trend/trend_quiz.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OddQuiz extends StatefulWidget {
  const OddQuiz({super.key});

  @override
  State<OddQuiz> createState() => _OddQuizState();
}

class _OddQuizState extends State<OddQuiz> {
  bool isOSelected = false; // O 버튼 선택 상태
  bool isXSelected = false; // X 버튼 선택 상태
  String? selectedAnswer; // 선택된 답안 ("O" 또는 "X")

  // 서버로 답안을 전송하는 메서드
  Future<void> submitAnswer(String answer) async {
    try {
      // 서버 요청 로직 (예: HTTP POST 요청)
      print("서버로 전송된 답안: $answer");
      // 예: await http.post(Uri.parse("http://example.com/submit"), body: {"answer": answer});
    } catch (e) {
      print("답안 전송 중 오류 발생: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1080.w,
        height: 2400.h,
        decoration: BoxDecoration(color: const Color(0xFFFAFAFA)),
        child: Column(
          children: [
            // 상단 뒤로가기 버튼
            Padding(
              padding: EdgeInsets.only(top: 140.h, left: 35.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(goToPage: 0),
                      ),
                    );
                  },
                  child: Icon(CustomIcon.back, size: 55.w),
                ),
              ),
            ),
            SizedBox(height: 50.h), // 간격 추가
            // 질문 영역
            Container(
              width: 992.w,
              height: 522.h,
              padding: const EdgeInsets.all(2),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 3.w, color: const Color(0xFFEBEBEB)),
                  borderRadius: BorderRadius.circular(33.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 3,
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFF9F1C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(52.94.r),
                      ),
                    ),
                    child: Text(
                      'Q1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 904.w,
                    child: Text(
                      '정보가 파악되지 않아 사회가 공식적으로 계측하는 경제활동 추계에 포함되지 않는 경제활동은?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF1C1C1C),
                        fontSize: 45.w,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h), // 간격 추가
            // X 버튼
            CountdownTimer(duration: 15),
            SizedBox(height: 50.h), // 간격 추가
            // O 버튼
            GestureDetector(
              onTap: () {
                setState(() {
                  isOSelected = !isOSelected; // O 버튼 선택
                });
              },
              child: Container(
                width: 992.w,
                height: 309.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFECECEC),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          width: 151.w,
                          height: 76.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFC4CAD4),
                            borderRadius: BorderRadius.circular(33.r),
                          ),
                          child: Center(
                            child: Text(
                              "HINT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 44.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          isOSelected ? "정말 모르겠을 때, 눌러주세요!" : "힌트으",
                          style: TextStyle(color: Color(0xFF8E95A2)),
                        ),
                        Text(
                          "키워드를 알려드릴게요!",
                          style: TextStyle(color: Color(0xFF8E95A2)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 486.w,
                  height: 342.h,
                  decoration: ShapeDecoration(
                    color: Colors.white, // 기본 흰색
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.75.w,
                        color: const Color(0xFFFF9F1C),
                      ),
                      borderRadius: BorderRadius.circular(33.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '한번 더 말해보기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFFF9F1C), // 기본 노란색
                        fontSize: 50.sp,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1.20.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3),
                Container(
                  width: 486.w,
                  height: 349.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF9F1C), // 선택된 경우 노란색
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.75.w,
                        color: const Color(0xFFFF9F1C),
                      ),
                      borderRadius: BorderRadius.circular(33.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '다음 문제',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white, // 선택된 경우 글자 흰색

                        fontSize: 50.sp,
                        fontFamily: 'Wanted Sans',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -1.20.w,
                      ),
                    ),
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

class CountdownTimer extends StatefulWidget {
  //import 'dart:async'; 후 사용
  //CountdownTimer(duration: 15) 로 사용

  final int duration;

  const CountdownTimer({super.key, required this.duration});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _currentTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = widget.duration;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentTime > 0) {
        setState(() {
          _currentTime--;
        });
      } else {
        _timer?.cancel();
        // 타이머 종료 시 필요한 동작 추가
        print('타이머 종료!');
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 992.w,
      height: 373.h,
      padding: const EdgeInsets.all(30),

      decoration: ShapeDecoration(
        color: Colors.white, // 현재 시간에 따라 배경색 변경
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2.75.w,
            color: const Color(0xFFFF9F1C) /* main-orange */,
          ),
          borderRadius: BorderRadius.circular(33.r),
        ),
      ),

      child: Center(
        child: Text(
          _formatTime(_currentTime), // 남은 시간 표시
          style: const TextStyle(
            fontSize: 40.0,
            fontFamily: 'Wanted Sans',
            fontWeight: FontWeight.w600,
            color: Color(0xFFFF9F1C),
          ),
        ),
      ),
    );
  }
}
