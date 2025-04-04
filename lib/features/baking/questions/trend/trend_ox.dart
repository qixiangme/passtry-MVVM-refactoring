import 'package:componentss/features/baking/baking_screen.dart';
import 'package:componentss/features/baking/questions/trend/trend_quiz.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendOx extends StatefulWidget {
  const TrendOx({super.key});

  @override
  State<TrendOx> createState() => _TrendOxState();
}

class _TrendOxState extends State<TrendOx> {
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
            GestureDetector(
              onTap: () {
                setState(() {
                  isOSelected = false; // O 버튼 선택 해제
                  isXSelected = true; // X 버튼 선택
                  selectedAnswer = "X"; // 선택된 답안 설정
                });
                submitAnswer("X"); // 서버로 답안 전송
              },
              child: Container(
                width: 992.w,
                height: 409.h,
                padding: const EdgeInsets.all(44),
                decoration: ShapeDecoration(
                  color:
                      isXSelected
                          ? const Color(0xFFFF9F1C) // 선택된 경우 노란색
                          : Colors.white, // 기본 흰색
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
                    'X',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          isXSelected
                              ? Colors
                                  .white // 선택된 경우 글자 흰색
                              : const Color(0xFFFF9F1C), // 기본 노란색
                      fontSize: 120.w,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -1.20.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h), // 간격 추가
            // O 버튼
            GestureDetector(
              onTap: () {
                setState(() {
                  isOSelected = true; // O 버튼 선택
                  isXSelected = false; // X 버튼 선택 해제
                  selectedAnswer = "O"; // 선택된 답안 설정
                });
                submitAnswer("O"); // 서버로 답안 전송
              },
              child: Container(
                width: 992.w,
                height: 409.h,
                padding: const EdgeInsets.all(44),
                decoration: ShapeDecoration(
                  color:
                      isOSelected
                          ? const Color(0xFFFF9F1C) // 선택된 경우 노란색
                          : Colors.white, // 기본 흰색
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
                    'O',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          isOSelected
                              ? Colors
                                  .white // 선택된 경우 글자 흰색
                              : const Color(0xFFFF9F1C), // 기본 노란색
                      fontSize: 120.w,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -1.20.w,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
