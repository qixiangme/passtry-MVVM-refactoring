import 'package:componentss/features/baking/view/setting/study_make_level_screen.dart';
import 'package:componentss/features/baking/viewmodel/baking_setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:componentss/icons/custom_icon_icons.dart';

class StudyMake2 extends ConsumerStatefulWidget {
  const StudyMake2({super.key});

  @override
  ConsumerState<StudyMake2> createState() => _StudyMakeState2();
}

class _StudyMakeState2 extends ConsumerState<StudyMake2> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(StudyMakeViewModelProvider.notifier);
    final state = ref.watch(StudyMakeViewModelProvider);
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String category = args['category'];
    final String category2 = args['category2'];

    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    final DateFormat timeFormatter = DateFormat('HH:mm:00');

    String displayDate =
        state.selectedDate != null
            ? dateFormatter.format(state.selectedDate!)
            : '날짜 선택';
    String displayTime =
        state.selectedTime != null
            ? timeFormatter.format(
              DateTime(
                2000,
                1,
                1,
                state.selectedTime!.hour,
                state.selectedTime!.minute,
              ),
            )
            : '시간 선택';

    int remainingDays = vm.calculateRemainingDays();

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
              onTap: () async {
                final selected = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (selected != null) {
                  vm.selectTime(selected);
                }
              },
            ),
            SizedBox(height: 40.h),
            // 시간 선택 영역
            _buildDateTimePickerRow(
              context: context,
              displayText: displayTime,
              icon: Icons.access_time_outlined,
              onTap: () async {
                final selected = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 1)),
                  lastDate: DateTime.now().add(Duration(days: 365 * 5)),
                );
                if (selected != null) {
                  vm.selectDate(selected);
                }
              },
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
                      (state.selectedDate != null && state.selectedTime != null)
                          ? () {
                            print('category: $category');
                            print('category2: $category2');
                            print('Selected Date: $displayDate');
                            print('Selected Time: $displayTime');
                            print('Remaining Days: $remainingDays');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudyMakeLevel(),
                                settings: RouteSettings(
                                  arguments: {
                                    'category': category,
                                    'category2': category2,
                                    'date': displayDate,
                                    'time': displayTime,
                                  }, // 전달할 데이터
                                ),
                              ),
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
