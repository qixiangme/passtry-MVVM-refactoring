import 'dart:math';
import 'package:componentss/core/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:componentss/features/study/data/group_api.dart';
import 'package:componentss/features/study/data/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

class DetailHome extends StatefulWidget {
  final GroupModel groupModel;

  const DetailHome({super.key, required this.groupModel});

  @override
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  GroupModel? _group;
  int? score;
  Map<String, int> _memberScores = {};
  String? username;

  Future<void> loadGroupAndScores(String joinCode) async {
    final groupApi = GroupApi();
    final group = await groupApi.getGroupByJoinCode(joinCode);
    print(group);

    if (group != null) {
      final scores = await fetchMemberScores(group.memberIds);

      setState(() {
        _group = group;
        _memberScores = scores;
      });
    } else {
      print('❌ 그룹 정보를 가져오지 못했습니다.');
    }
  }

  // 사용자 ID로 사용자 데이터를 가져오는 함수
  Future<Map<String, dynamic>?> getUserById(String userId) async {
    const String baseUrl = 'http://34.64.233.128:5200/auth/users';
    final url = Uri.parse('$baseUrl/$userId/id');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // JSON 데이터를 Map으로 변환
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        print('❌ 사용자 데이터를 가져오지 못했습니다. 상태 코드: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('❌ 사용자 데이터를 가져오는 중 오류 발생: $e');
      return null;
    }
  }

  Future<void> loadUserData(String userId) async {
    final userData = await getUserById(userId);

    if (userData != null) {
      setState(() {
        username = userData['username']; // 사용자 이름 저장
      });
      // 사용자 데이터를 상태로 저장하거나 UI에 반영
    } else {
      print('❌ 사용자 데이터를 가져오지 못했습니다.');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // UserProvider를 통해 사용자 정보 가져오기
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    if (user != null) {
      loadUserData(user.id!); // 사용자 데이터 로드
    }
  }

  @override
  void initState() {
    super.initState();
    loadGroupAndScores(widget.groupModel.joinCode);
  }

  Widget _buildMemberList() {
    if (_group == null || _memberScores.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    if (_group!.memberIds.isEmpty) {
      return Center(
        child: Text(
          '멤버가 없습니다.',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true, // 부모 위젯의 크기에 맞게 리스트뷰 크기 조정
      itemCount: _group!.memberIds.length,
      itemBuilder: (context, index) {
        final memberId = username;
        final score = _memberScores[memberId] ?? 0;

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

  Widget _buildSingleMember() {
    if (_group == null || _memberScores.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    // 첫 번째 멤버 가져오기
    final memberId = _group!.memberIds.isNotEmpty ? _group!.memberIds[0] : null;
    final score = memberId != null ? _memberScores[memberId] ?? 0 : 0;

    if (memberId == null) {
      return Center(
        child: Text(
          '멤버가 없습니다.',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(
                memberId.substring(0, 2), // 멤버 ID의 일부를 표시
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Member ID: $memberId',
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
