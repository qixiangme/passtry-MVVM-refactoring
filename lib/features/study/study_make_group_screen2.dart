import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


class StudyMakeGroup2 extends StatefulWidget {
  const StudyMakeGroup2({super.key});

  @override
  State<StudyMakeGroup2> createState() => _StudyMakeGroupState2();
}

class _StudyMakeGroupState2 extends State<StudyMakeGroup2> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // 남은 일 수 계산 (기존과 동일)
  int _calculateRemainingDays() {
    if (_selectedDate == null) {
      return 0;
    }
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final interviewDate = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
    );
    final difference = interviewDate.difference(today).inDays;
    return difference >= 0 ? difference : 0;
  }

  // 날짜 선택 Bottom Sheet 표시 (기존과 동일)
  void _showDatePicker(BuildContext context) {
    DateTime initialDate = _selectedDate ?? DateTime.now();
    DateTime firstDate = DateTime.now().subtract(Duration(days: 1));
    DateTime lastDate = DateTime.now().add(Duration(days: 365 * 5));

    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        DateTime tempDate = initialDate;
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: initialDate,
                  minimumDate: firstDate,
                  maximumDate: lastDate,
                  onDateTimeChanged: (DateTime newDate) {
                    tempDate = newDate;
                  },
                ),
              ),
              CupertinoButton(
                child: Text('확인', style: TextStyle(color: Colors.orange)),
                onPressed: () {
                  setState(() {
                    _selectedDate = tempDate;

                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // 시간 선택 Bottom Sheet 표시 (기존과 동일)
  void _showTimePicker(BuildContext context) {
    DateTime initialDateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      _selectedTime?.hour ?? DateTime.now().hour,
      _selectedTime?.minute ?? DateTime.now().minute,
    );

    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        DateTime tempDateTime = initialDateTime;
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: initialDateTime,
                  use24hFormat: true,
                  onDateTimeChanged: (DateTime newDateTime) {
                    tempDateTime = newDateTime;
                  },
                ),
              ),
              CupertinoButton(
                child: Text('확인', style: TextStyle(color: Colors.orange)),
                onPressed: () {
                  setState(() {
                    _selectedTime = TimeOfDay.fromDateTime(tempDateTime);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 날짜/시간 포맷터 (기존과 동일)
    final DateFormat dateFormatter = DateFormat('yyyy.MM.dd');
    final DateFormat timeFormatter = DateFormat('HH:mm');

    String displayDate =
    _selectedDate != null ? dateFormatter.format(_selectedDate!) : '날짜 선택';
    String displayTime =
    _selectedTime != null
        ? timeFormatter.format(
      DateTime(2000, 1, 1, _selectedTime!.hour, _selectedTime!.minute),
    )
        : '시간 선택';

    int remainingDays = _calculateRemainingDays();

    return Scaffold(
      backgroundColor: Colors.white, // 전체 배경색 (이전 코드 참고)
      body: Padding(
        // 좌우 패딩은 이전 코드의 77.w 유지, 상하 패딩 추가 고려
        padding: EdgeInsets.symmetric(horizontal: 77.w, vertical: 20.h),
        // 상하 패딩 추가
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150.h),

            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // 이전 페이지로 이동
              },
            ),
            SizedBox(height: 100.h),

            Text(
              '면접 날짜와 시간을 알려주세요',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontSize: 70.sp, // ScreenUtil 적용
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h), // 간격 조정
            Text(
              '남은 날짜에 맞추어 준비를 도와드릴게요',
              style: TextStyle(
                color: const Color(0xFF8E95A2),
                fontSize: 44.sp,
                // ScreenUtil 적용
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.44,
              ),
            ),
            SizedBox(height: 120.h), // 간격 유지 또는 조정
            // 날짜 선택 영역
            _buildDateTimePickerRow(
              context: context,
              displayText: displayDate,
              icon: Icons.calendar_today_outlined,
              onTap: () => _showDatePicker(context),
            ),
            SizedBox(height: 40.h), // 간격 조정 (이전 15 보다 늘림)
            // 시간 선택 영역
            _buildDateTimePickerRow(
              context: context,
              displayText: displayTime,
              icon: Icons.access_time_outlined,
              onTap: () => _showTimePicker(context),
            ),
            SizedBox(height: 70.h), // 간격 조정 (이전 50.h 보다 늘림)
            // 남은 날짜 표시 영역 (가운데 정렬된 스타일로 변경)
            Container(
              width: double.infinity,
              // 너비 최대로 설정하여 중앙 정렬 효과
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
              // ScreenUtil 적용
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(33.r), // ScreenUtil 적용
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                // Row 로 변경하여 중앙 정렬
                mainAxisAlignment: MainAxisAlignment.start, // Row 내부 중앙 정렬
                children: [
                  Text(
                    '면접까지 ',
                    style: TextStyle(fontSize: 45.sp), // ScreenUtil 적용
                  ),
                  Text(
                    '$remainingDays일',
                    style: TextStyle(
                      fontSize: 45.sp, // ScreenUtil 적용
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    ' 남음',
                    style: TextStyle(fontSize: 45.sp), // ScreenUtil 적용
                  ),
                ],
              ),
            ),

            // Spacer() 추가하여 버튼을 하단으로 밀기
            Spacer(),

            // 하단 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 45.h),
                  // ScreenUtil 적용
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33.r), // ScreenUtil 적용
                  ),
                  elevation: 0,
                ),
                onPressed:
                (_selectedDate != null && _selectedTime != null)
                    ? () {
                  print('Selected Date: $displayDate');
                  print('Selected Time: $displayTime');
                  print('Remaining Days: $remainingDays');
                  // 다음 로직
                }
                    : null,
                child: Text(
                  '다음',
                  style: TextStyle(
                    fontSize: 50.sp, // ScreenUtil 적용
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h), // 하단 여백 추가
          ],
        ),
      ),
    );
  }

  // Helper 위젯 함수 (_buildDateTimePickerRow)는 동일하게 사용
  Widget _buildDateTimePickerRow({
    required BuildContext context,
    required String displayText,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    bool isSelected = displayText != '날짜 선택' && displayText != '시간 선택';
    return InkWell(
      onTap: onTap,
      child: Container(
        // 내부 패딩에 ScreenUtil 적용
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        decoration: BoxDecoration(
          color: Colors.white,
          // BorderRadius 에 ScreenUtil 적용
          borderRadius: BorderRadius.circular(33.r),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              displayText,
              style: TextStyle(
                // fontSize 에 ScreenUtil 적용
                fontSize: 45.sp,
                color: isSelected ? Colors.black : Colors.grey[500],
              ),
            ),
            Icon(icon, color: Colors.grey[600]),
          ],
        ),
      ),
    );
  }
}
