import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:componentss/features/study/study_make_group_level_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';

class StudyMakeGroup2 extends StatefulWidget {
  const StudyMakeGroup2({super.key});

  @override
  State<StudyMakeGroup2> createState() => _StudyMakeGroupState2();
}

class _StudyMakeGroupState2 extends State<StudyMakeGroup2> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // 남은 일 수 계산
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

  // 날짜 선택 Bottom Sheet 표시
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

  // 시간 선택 Bottom Sheet 표시
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
    // 날짜/시간 포맷터
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(CustomIcon.back, size: 18),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 77.w, vertical: 50.h),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 100.h),

            Text(
              '면접 날짜와 시간을 알려주세요',
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontSize: 70.sp,
                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '남은 날짜에 맞추어 준비를 도와드릴게요',
              style: TextStyle(
                color: const Color(0xFF8E95A2),
                fontSize: 44.sp,

                fontFamily: 'Wanted Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.44,
              ),
            ),
            SizedBox(height: 120.h),
            // 날짜 선택 영역
            _buildDateTimePickerRow(
              context: context,
              displayText: displayDate,
              icon: Icons.calendar_today_outlined,
              onTap: () => _showDatePicker(context),
            ),
            SizedBox(height: 40.h),
            // 시간 선택 영역
            _buildDateTimePickerRow(
              context: context,
              displayText: displayTime,
              icon: Icons.access_time_outlined,
              onTap: () => _showTimePicker(context),
            ),
            SizedBox(height: 70.h),
            // 남은 날짜 표시 영역
            Container(
              width: double.infinity,

              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(33.r), // ScreenUtil 적용
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('면접까지 ', style: TextStyle(fontSize: 45.sp)),
                  Text(
                    '$remainingDays일',
                    style: TextStyle(
                      fontSize: 45.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(' 남음', style: TextStyle(fontSize: 45.sp)),
                ],
              ),
            ),

            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 200.h),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 45.h),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed:
                      (_selectedDate != null && _selectedTime != null)
                          ? () {
                            print('Selected Date: $displayDate');
                            print('Selected Time: $displayTime');
                            print('Remaining Days: $remainingDays');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StudyMakeGroupLevel()),
                            );
                          }
                          : null,
                  child: Text(
                    '다음',
                    style: TextStyle(
                      fontSize: 50.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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

  // Helper 위젯 함수
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
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(33.r),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              displayText,
              style: TextStyle(
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
