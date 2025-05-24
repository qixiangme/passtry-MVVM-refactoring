import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 170),
            child: Row(
              children: [
                Text(
                  'D',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                    fontSize: 75.51.w,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.76.w,
                  ),
                ),
                Text(
                  '-',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                    fontSize: 75.51.w,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.76.w,
                  ),
                ),
                Text(
                  '0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                    fontSize: 75.51.w,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.76.w,
                  ),
                ),
                Text(
                  '7',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                    fontSize: 75.51.w,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.76.w,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
