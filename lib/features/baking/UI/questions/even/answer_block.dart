import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/baking/UI/baking_screen.dart';
import 'package:componentss/features/baking/data/interview/interview_model.dart';
import 'package:componentss/features/baking/data/mission/mission_api.dart';
import 'package:componentss/features/baking/data/mission/mission_model.dart';
import 'package:componentss/features/baking/UI/questions/even/answer_screen.dart';
import 'package:componentss/features/main_screen.dart';
import 'package:componentss/icons/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AnswerBlock extends StatefulWidget {
  final Mission mission;
  final InterviewModel inteview;
  const AnswerBlock({super.key, required this.mission, required this.inteview});

  @override
  State<AnswerBlock> createState() => _AnswerBlockState();
}

//로그인 로딩 처리
class _AnswerBlockState extends State<AnswerBlock> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    return Scaffold(
      body: Container(
        width: 1080.w,
        height: 2400.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: const Color(0xFFFAFAFA)),
        child: Stack(
          children: [
            Positioned(
              top: 140.h,
              left: 35.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(CustomIcon.back, size: 55.w),
              ),
            ),
            Positioned(
              left: 44.w,
              top: 318.h,
              child: Container(
                width: 992.w,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.75.w,
                      color: const Color(0xFFEBEBEB) /* light-gray */,
                    ),
                    borderRadius: BorderRadius.circular(38.50.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 49.60.w,
                  children: [
                    SizedBox(
                      width: 914.84.w,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Q. ",
                              style: TextStyle(
                                color: const Color(
                                  0xFFFF9F1C,
                                ) /* main-orange */,
                                fontSize: 41.5.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: widget.mission.question,
                              style: TextStyle(
                                color: const Color(0xFF1C1C1C) /* main-black */,
                                fontSize: 41.5.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w700,
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
            Positioned(
              left: 44.w,
              top: 482.h,
              child: Container(
                width: 992.w,
                height: 1480.h,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white /* white */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.75.w,
                      color: const Color(0xFFEBEBEB) /* light-gray */,
                    ),
                    borderRadius: BorderRadius.circular(38.50.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 49.60.w,
                  children: [
                    SizedBox(
                      width: 914.84.w,
                      height: 1413.87.h,
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: '답변 작성하기',
                          hintStyle: TextStyle(
                            color: const Color(0xFF6B6B6B), // dark-gray
                            fontSize: 40.w,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: const Color(0xFF1C1C1C), // main-black
                          fontSize: 40.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: null, // Enables auto line break
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 44.w,
              top: 2032.h,
              child: GestureDetector(
                onTap: () {
                  final userId = user!.id!; // 실제 유저 ID를 가져오는 로직 확인
                  final missionId =
                      "${widget.mission.stage}-${widget.mission.index}";
                  final content = _controller.text;

                  submitAnswer(
                    userId: userId,
                    missionId: missionId,
                    content: content,
                  );

                  completeMission(
                    userId: userId,
                    interviewId: widget.inteview.id!,

                    stage: widget.mission.stage,
                    index: widget.mission.index,
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(goToPage: 0),
                    ),
                  );
                },
                child: Container(
                  width: 993.w,
                  height: 160.h,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 27.50.w,
                    children: [
                      Text(
                        '제출하기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white /* white */,
                          fontSize: 50.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.50.w,
                        ),
                      ),
                    ],
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
