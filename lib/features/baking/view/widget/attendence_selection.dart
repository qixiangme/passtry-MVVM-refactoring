import 'package:componentss/features/baking/viewmodel/baking_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget buildAttendanceSection(WidgetRef ref) {
  // 요일 이름과 날짜를 매핑
  final state = ref.watch(BakingScreenViewModelProvider);
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
              state.isLoadingScore
                  ? const CircularProgressIndicator() // 로딩 중
                  : Text(
                    '오늘의 점수: ${state.userScore ?? 0}', // 점수 표시
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
              bool isAttended = state.attendanceHistory.any(
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
