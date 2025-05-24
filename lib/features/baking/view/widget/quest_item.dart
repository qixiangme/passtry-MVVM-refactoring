import 'package:componentss/features/baking/view/baking_screen.dart';
import 'package:componentss/features/baking/view/questions/even/answer_screen.dart';
import 'package:componentss/features/baking/view/questions/odd/odd_screen.dart';
import 'package:componentss/features/baking/view/widget/AnimatedHalfCircleProgress.dart';
import 'package:componentss/features/baking/data/mission/mission_response_model.dart';
import 'package:componentss/features/baking/viewmodel/baking_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

Widget buildQuestItem(
  Quest quest,
  MissionResponse missionresponse,
  BuildContext context,
  WidgetRef ref,
) {
  final state = ref.watch(BakingScreenViewModelProvider);
  return GestureDetector(
    onTap: () {
      if (quest.title == "모범답안 작성하기") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => OddScreen(
                  mission: missionresponse.nextOddMission,
                  inteview: state.interviews[state.index],
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
                  inteview: state.interviews[state.index],
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
                color: quest.isCompleted ? Colors.white : Colors.grey.shade800,
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
                      quest.isCompleted ? Colors.orange : Colors.grey.shade800,

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
