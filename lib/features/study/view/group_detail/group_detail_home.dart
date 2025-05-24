import 'dart:math';
import 'package:componentss/core/user_provider.dart';
import 'package:componentss/features/study/viewmodel/group_detail_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:componentss/features/study/data/group_api.dart';
import 'package:componentss/features/study/data/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailHome extends ConsumerStatefulWidget {
  final GroupModel groupModel;

  const DetailHome({super.key, required this.groupModel});

  @override
  ConsumerState<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends ConsumerState<DetailHome> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // UserProvider를 통해 사용자 정보 가져오기
    final user = ref.watch(userProvider);
    final vm = ref.watch(groupDetailViewModelProvider.notifier);

    if (user != null) {
      vm.loadUserData(user.id!); // 사용자 데이터 로드
    }
  }

  @override
  void initState() {
    final vm = ref.watch(groupDetailViewModelProvider.notifier);
    super.initState();
    vm.loadGroupAndScores(widget.groupModel.joinCode);
  }

  Widget _buildMemberList() {
    final state = ref.watch(groupDetailViewModelProvider);

    if (state.group == null || state.memberScores.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    if (state.group!.memberIds.isEmpty) {
      return Center(
        child: Text(
          '멤버가 없습니다.',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true, // 부모 위젯의 크기에 맞게 리스트뷰 크기 조정
      itemCount: state.group!.memberIds.length,
      itemBuilder: (context, index) {
        final memberId =  state.username;
        final score = state.memberScores[memberId] ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' $memberId',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'Score: $score',
                      style: TextStyle(color: Colors.orange, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 2074.h,
                color: Color(0xFF434343),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 130.w,
                          height: 154.h,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.r),
                          ),
                        ),

                        Container(
                          width: 130.w,
                          height: 154.h,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.r),
                          ),
                        ),

                        Container(
                          width: 130.w,
                          height: 154.h,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.r),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Center(child: AnimatedHalfCircleProgress()),
                        Padding(
                          padding: EdgeInsets.only(top: 90),
                          child: Center(
                            child: Container(
                              width: 611.w,
                              height: 500.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/icons/dough.png',
                                  ), // AssetImage를 DecorationImage로 감쌈
                                  fit: BoxFit.cover, // 이미지 크기 조정
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0x21FF9F1C),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2.96.w,
                              color: const Color(0xFFFF9F1C) /* main-orange */,
                            ),
                            borderRadius: BorderRadius.circular(29.57.w),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 29.57.w,
                          children: [
                            Text(
                              'Lv.0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(
                                  0xFFFF9F1C,
                                ) /* main-orange */,
                                fontSize: 36.w,
                                fontFamily: 'Wanted Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        '따끈따끈한 반죽',
                        style: TextStyle(
                          color: Colors.white /* white */,
                          fontSize: 66.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '오늘 획득한 그룹 포인트',
                        style: TextStyle(
                          color: Colors.white /* white */,
                          fontSize: 50.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Stack(
                    //   children: [
                    //     Center(
                    //       child: Opacity(
                    //         opacity: 0.10.w,
                    //         child: Container(
                    //           width: 992.w,
                    //           height: 522.h,
                    //           decoration: ShapeDecoration(
                    //             color: const Color(0xFFD9D9D9),
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(38.50.w),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Center(
                    //       child: Padding(
                    //         padding: EdgeInsets.only(top: 15),
                    //         child: SizedBox(
                    //           width: 868.w,
                    //           child: Row(
                    //             mainAxisSize: MainAxisSize.min,
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             spacing: 315.w,
                    //             children: [
                    //               Row(
                    //                 mainAxisSize: MainAxisSize.min,
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 crossAxisAlignment: CrossAxisAlignment.center,
                    //                 spacing: 42.w,
                    //                 children: [
                    //                   Container(
                    //                     width: 150.w,
                    //                     height: 150.h,
                    //                     decoration: ShapeDecoration(
                    //                       image: DecorationImage(
                    //                         image: NetworkImage(
                    //                           "https://placehold.co/150x150",
                    //                         ),
                    //                         fit: BoxFit.cover,
                    //                       ),
                    //                       shape: OvalBorder(
                    //                         side: BorderSide(
                    //                           width: 1.68.w,
                    //                           color: const Color(
                    //                             0xFFC4CAD4,
                    //                           ) /* gray */,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     width: 241.w,
                    //                     child: Column(
                    //                       mainAxisSize: MainAxisSize.min,
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.start,
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       spacing: 23.w,
                    //                       children: [
                    //                         SizedBox(
                    //                           width: 241.w,
                    //                           height: 60.h,
                    //                           child: Text(
                    //                             'Username',
                    //                             style: TextStyle(
                    //                               color: Colors.white /* white */,
                    //                               fontSize: 50.w,
                    //                               fontFamily: 'Wanted Sans',
                    //                               fontWeight: FontWeight.w600,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Container(
                    //                           width: 123.31.w,
                    //                           height: 66.65.h,
                    //                           padding: const EdgeInsets.symmetric(
                    //                             horizontal: 5,
                    //                             vertical: 3,
                    //                           ),
                    //                           clipBehavior: Clip.antiAlias,
                    //                           decoration: ShapeDecoration(
                    //                             color: const Color(
                    //                               0xFF6B6B6B,
                    //                             ) /* dark-gray */,
                    //                             shape: RoundedRectangleBorder(
                    //                               side: BorderSide(
                    //                                 width: 2.96.w,
                    //                                 color: const Color(
                    //                                   0xFFC4CAD4,
                    //                                 ) /* gray */,
                    //                               ),
                    //                               borderRadius:
                    //                                   BorderRadius.circular(
                    //                                     29.57.w,
                    //                                   ),
                    //                             ),
                    //                           ),
                    //                           child: Row(
                    //                             mainAxisSize: MainAxisSize.min,
                    //                             mainAxisAlignment:
                    //                                 MainAxisAlignment.center,
                    //                             crossAxisAlignment:
                    //                                 CrossAxisAlignment.center,
                    //                             spacing: 29.57.w,
                    //                             children: [
                    //                               Text(
                    //                                 'level',
                    //                                 textAlign: TextAlign.center,
                    //                                 style: TextStyle(
                    //                                   color: const Color(
                    //                                     0xFFC4CAD4,
                    //                                   ) /* gray */,
                    //                                   fontSize: 36.w,
                    //                                   fontFamily: 'Wanted Sans',
                    //                                   fontWeight: FontWeight.w400,
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Text(
                    //                 '20 p',
                    //                 textAlign: TextAlign.center,
                    //                 style: TextStyle(
                    //                   color: const Color(
                    //                     0xFFFF9F1C,
                    //                   ) /* main-orange */,
                    //                   fontSize: 55.w,
                    //                   fontFamily: 'Wanted Sans',
                    //                   fontWeight: FontWeight.w900,
                    //                   letterSpacing: -0.55.w,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Center(
                    //       child: Padding(
                    //         padding: EdgeInsets.only(top: 120),
                    //         child: SizedBox(
                    //           width: 868.w,
                    //           child: Row(
                    //             mainAxisSize: MainAxisSize.min,
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             spacing: 31.w,
                    //             children: [
                    //               Row(
                    //                 mainAxisSize: MainAxisSize.min,
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 crossAxisAlignment: CrossAxisAlignment.center,
                    //                 spacing: 42.w,
                    //                 children: [
                    //                   Container(
                    //                     width: 150.w,
                    //                     height: 150.h,
                    //                     decoration: ShapeDecoration(
                    //                       image: DecorationImage(
                    //                         image: NetworkImage(
                    //                           "https://placehold.co/150x150",
                    //                         ),
                    //                         fit: BoxFit.cover,
                    //                       ),
                    //                       shape: OvalBorder(
                    //                         side: BorderSide(
                    //                           width: 1.68.w,
                    //                           color: const Color(
                    //                             0xFFC4CAD4,
                    //                           ) /* gray */,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     width: 241.w,
                    //                     child: Column(
                    //                       mainAxisSize: MainAxisSize.min,
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.start,
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       spacing: 23.w,
                    //                       children: [
                    //                         SizedBox(
                    //                           width: 241.w,
                    //                           height: 60.h,
                    //                           child: Text(
                    //                             'Username',
                    //                             style: TextStyle(
                    //                               color: Colors.white /* white */,
                    //                               fontSize: 50.w,
                    //                               fontFamily: 'Wanted Sans',
                    //                               fontWeight: FontWeight.w600,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         Container(
                    //                           width: 123.31.w,
                    //                           height: 66.65.h,
                    //                           padding: const EdgeInsets.symmetric(
                    //                             horizontal: 5,
                    //                             vertical: 3,
                    //                           ),
                    //                           clipBehavior: Clip.antiAlias,
                    //                           decoration: ShapeDecoration(
                    //                             color: const Color(
                    //                               0xFF6B6B6B,
                    //                             ) /* dark-gray */,
                    //                             shape: RoundedRectangleBorder(
                    //                               side: BorderSide(
                    //                                 width: 2.96.w,
                    //                                 color: const Color(
                    //                                   0xFFC4CAD4,
                    //                                 ) /* gray */,
                    //                               ),
                    //                               borderRadius:
                    //                                   BorderRadius.circular(
                    //                                     29.57.w,
                    //                                   ),
                    //                             ),
                    //                           ),
                    //                           child: Row(
                    //                             mainAxisSize: MainAxisSize.min,
                    //                             mainAxisAlignment:
                    //                                 MainAxisAlignment.center,
                    //                             crossAxisAlignment:
                    //                                 CrossAxisAlignment.center,
                    //                             spacing: 29.57.w,
                    //                             children: [
                    //                               Text(
                    //                                 'level',
                    //                                 textAlign: TextAlign.center,
                    //                                 style: TextStyle(
                    //                                   color: const Color(
                    //                                     0xFFC4CAD4,
                    //                                   ) /* gray */,
                    //                                   fontSize: 36.w,
                    //                                   fontFamily: 'Wanted Sans',
                    //                                   fontWeight: FontWeight.w400,
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Text(
                    //                 '20 p',
                    //                 textAlign: TextAlign.center,
                    //                 style: TextStyle(
                    //                   color: const Color(
                    //                     0xFFFF9F1C,
                    //                   ) /* main-orange */,
                    //                   fontSize: 55.w,
                    //                   fontFamily: 'Wanted Sans',
                    //                   fontWeight: FontWeight.w900,
                    //                   letterSpacing: -0.55.w,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Center(
                      child: SizedBox(
                        height: 552.h,
                        width: 1080.w,
                        child: _buildMemberList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20,
              child: SizedBox(
                width: 120.w,
                height: 120.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 10.w,
                      top: 20.h,
                      child: Image.asset(
                        'assets/icons/yellowBread.png',
                        width: 100.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedHalfCircleProgress extends StatefulWidget {
  const AnimatedHalfCircleProgress({super.key});

  @override
  _AnimatedHalfCircleProgressState createState() =>
      _AnimatedHalfCircleProgressState();
}

class _AnimatedHalfCircleProgressState extends State<AnimatedHalfCircleProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 0, end: 0).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(900.w, 450.h),
          painter: HalfCircleProgressPainter(progress: _animation.value),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HalfCircleProgressPainter extends CustomPainter {
  final double progress;

  HalfCircleProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint =
        Paint()
          ..color = Color(0xFFD9D9D9)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Paint progressPaint =
        Paint()
          ..color = Color(0xFFFF9F1C)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    canvas.drawArc(rect, pi, pi, false, backgroundPaint);
    canvas.drawArc(rect, pi, pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
