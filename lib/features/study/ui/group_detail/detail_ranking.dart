import 'package:componentss/features/study/data/group_api.dart';
import 'package:componentss/features/study/data/group_model.dart';
import 'package:componentss/features/study/data/ranking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailRanking extends StatefulWidget {
  final GroupModel groupModel;

  const DetailRanking({super.key, required this.groupModel});

  @override
  State<DetailRanking> createState() => _DetailRankingState();
}

class _DetailRankingState extends State<DetailRanking> {
  List<RankingModel> _rankings = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadRankingData(); // 랭킹 데이터를 로드
  }

  Future<void> _loadRankingData() async {
    print("🔄 랭킹 데이터 로드 시작");
    final rankings = await fetchDailyRanking(widget.groupModel.id);

    setState(() {
      _rankings = rankings;
      _isLoading = false;
    });
  }

  Widget _buildRankingList() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_rankings.isEmpty) {
      return Center(
        child: Text(
          '랭킹 데이터가 없습니다.',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: _rankings.length,
      itemBuilder: (context, index) {
        final ranking = _rankings[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text(
                        ranking.rank.toString(), // 랭크 표시
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ranking.userName,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          'Score: ${ranking.score}',
                          style: TextStyle(color: Colors.orange, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '#${ranking.rank}',
                  style: TextStyle(color: Colors.white, fontSize: 16),
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
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildRankingList(),
          ),
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: 1080.w,
                  height: 2906.h,
                  decoration: BoxDecoration(color: const Color(0xFF434343)),
                ),
              ),
              Positioned(
                left: 0.w,
                top: 0.h,
                child: SizedBox(
                  width: 1080.w,
                  height: 105.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 726.w,
                        top: 36.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 6.w,
                          children: [
                            Container(
                              width: 45.w,
                              height: 45.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            Container(
                              width: 48.w,
                              height: 48.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            Container(
                              width: 45.w,
                              height: 45.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            Container(
                              width: 45.w,
                              height: 45.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            Container(
                              width: 45.w,
                              height: 45.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                            Container(
                              transform:
                                  Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(-1.57),
                              height: 48.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // 첫 번째 박스
                left: 44.w,
                top: 208.h,
                child: Opacity(
                  opacity: 0.10.w,
                  child: Container(
                    width: 992.w,
                    height: 240.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38.50.w),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // 세 번째 박스
                left: 44.w,
                top: 1128.h,
                child: Opacity(
                  opacity: 0.10.w,
                  child: Container(
                    width: 992.w,
                    height: 240.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38.50.w),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // 두 번째 박스
                left: 44.w,
                top: 480.h,
                child: Opacity(
                  opacity: 0.10.w,
                  child: Container(
                    width: 992.w,
                    height: 240.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38.50.w),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                //네 번째 박스
                left: 44.w,
                top: 1400.h,
                child: Opacity(
                  opacity: 0.10.w,
                  child: Container(
                    width: 992.w,
                    height: 240.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38.50.w),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 66.w,
                top: 80.h,
                child: Text(
                  '우리 스터디 순위는?',
                  style: TextStyle(
                    color: Colors.white /* white */,
                    fontSize: 50.w,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 66.w,
                top: 1000.h,
                child: Text(
                  '오늘 제일 열심히 준비한 팀원은?',
                  style: TextStyle(
                    color: Colors.white /* white */,
                    fontSize: 50.w,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 193.w,
                top: 248.h,
                child: Opacity(
                  opacity: 0.50.w,
                  child: SizedBox(
                    width: 800.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 42.w,
                          children: [
                            Container(
                              width: 150.w,
                              height: 150.h,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://placehold.co/150x150",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                shape: OvalBorder(
                                  side: BorderSide(
                                    width: 1.68.w,
                                    color: const Color(0xFFC4CAD4) /* gray */,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 300.w,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 23.w,
                                children: [
                                  Text(
                                    'Groupname',
                                    style: TextStyle(
                                      color: Colors.white /* white */,
                                      fontSize: 50.w,
                                      fontFamily: 'Wanted Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Container(
                                    width: 123.31.w,
                                    height: 66.65.h,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 3,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: const Color(
                                        0xFF6B6B6B, //첫번째 level 박스
                                      ) /* dark-gray */,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 2.96.w,
                                          color: const Color(
                                            0xFFC4CAD4,
                                          ) /* gray */,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          29.57.w,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: 29.57.w,
                                      children: [
                                        Text(
                                          'level',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(
                                              0xFFffffff,
                                            ) /* gray */,
                                            fontSize: 36.w,
                                            fontFamily: 'Wanted Sans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '1000 p',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white /* white */,
                            fontSize: 50.w,
                            fontFamily: 'Wanted Sans',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.50.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 193.w,
                top: 1168.h,
                child: SizedBox(
                  width: 800.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 42.w,
                        children: [
                          Container(
                            width: 150.w,
                            height: 150.h,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://placehold.co/150x150",
                                ),
                                fit: BoxFit.cover,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(
                                  width: 1.68.w,
                                  color: const Color(0xFFC4CAD4) /* gray */,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 241.w,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 23.w,
                              children: [
                                SizedBox(
                                  width: 241.w,
                                  height: 60.h,
                                  child: Text(
                                    'Username',
                                    style: TextStyle(
                                      color: Colors.white /* white */,
                                      fontSize: 50.w,
                                      fontFamily: 'Wanted Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 123.31.w,
                                  height: 66.65.h,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 3,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(
                                      0xFF6B6B6B,
                                    ) /* dark-gray */, // 세 번째 level 박스
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 2.96.w,
                                        color: const Color(
                                          0xFFC4CAD4,
                                        ) /* gray */,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        29.57.w,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 29.57.w,
                                    children: [
                                      Text(
                                        'level',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: 36.w,
                                          fontFamily: 'Wanted Sans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '20 p',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white /* white */,
                          fontSize: 50.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.50.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 193.w,
                top: 520.h,
                child: SizedBox(
                  width: 800.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 42.w,
                        children: [
                          Container(
                            width: 150.w,
                            height: 150.h,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://placehold.co/150x150",
                                ),
                                fit: BoxFit.cover,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(
                                  width: 1.68.w,
                                  color: const Color(0xFFC4CAD4) /* gray */,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300.w,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 23.w,
                              children: [
                                Text(
                                  'Groupname',
                                  style: TextStyle(
                                    color: Colors.white /* white */,
                                    fontSize: 50.w,
                                    fontFamily: 'Wanted Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  width: 123.31.w,
                                  height: 66.65.h,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 3,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(
                                      0xFF6B6B6B,
                                    ) /* dark-gray */, // 두번째 level 박스
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 2.96.w,
                                        color: const Color(
                                          0xFFC4CAD4,
                                        ) /* gray */,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        29.57.w,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 29.57.w,
                                    children: [
                                      Text(
                                        'level',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: const Color(
                                            0xFFFFFFFF,
                                          ) /* gray */,
                                          fontSize: 36.w,
                                          fontFamily: 'Wanted Sans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '988 p',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white /* white */,
                          fontSize: 50.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.50.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 193.w,
                top: 1440.h,
                child: SizedBox(
                  width: 800.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 42.w,
                        children: [
                          Container(
                            width: 150.w,
                            height: 150.h,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://placehold.co/150x150",
                                ),
                                fit: BoxFit.cover,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(
                                  width: 1.68.w,
                                  color: const Color(0xFFC4CAD4) /* gray */,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 241.w,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 23.w,
                              children: [
                                SizedBox(
                                  width: 241.w,
                                  height: 60.h,
                                  child: Text(
                                    'Username',
                                    style: TextStyle(
                                      color: Colors.white /* white */,
                                      fontSize: 50.w,
                                      fontFamily: 'Wanted Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 123.31.w,
                                  height: 66.65.h,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 3,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(
                                      0xFF6B6B6B,
                                    ) /* dark-gray */, // 네 번째 level 박스
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 2.96.w,
                                        color: const Color(
                                          0xFFC4CAD4,
                                        ) /* gray */,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        29.57.w,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 29.57.w,
                                    children: [
                                      Text(
                                        'level',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: const Color(
                                            0xFFFfffff,
                                          ) /* gray */,
                                          fontSize: 36.w,
                                          fontFamily: 'Wanted Sans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '15 p',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white /* white */,
                          fontSize: 50.w,
                          fontFamily: 'Wanted Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.50.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 85.w,
                top: 290.h,
                child: Opacity(
                  opacity: 0.50.w,
                  child: Text(
                    '26',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white /* white */,
                      fontSize: 55.w,
                      fontFamily: 'Wanted Sans',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.55.w,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 104.w,
                top: 1210.h,
                child: Text(
                  '1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                    fontSize: 55.w,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.55.h,
                  ),
                ),
              ),
              Positioned(
                left: 85.w,
                top: 562.h,
                child: Text(
                  '27',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFF9F1C) /* main-orange */,
                    fontSize: 55.w,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.55.w,
                  ),
                ),
              ),
              Positioned(
                left: 100.w,
                top: 1482.h,
                child: Text(
                  '2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white /* white */,
                    fontSize: 55.w,
                    fontFamily: 'Wanted Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.55.h,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
