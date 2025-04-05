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

    return SizedBox(
      width: 1000.w,
      height: 500.h, // 랭킹 카드의 높이
      child: ListView.builder(
        scrollDirection: Axis.vertical, // 가로 스크롤 설정
        itemCount: _rankings.length,
        itemBuilder: (context, index) {
          final ranking = _rankings[index];

          return Container(
            width: 1000.w, // 각 랭킹 카드의 너비
            height: 1000.h,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 90.w,
                  backgroundColor: Colors.grey,
                  child: Text(
                    ranking.rank.toString(), // 랭크 표시
                    style: TextStyle(color: Colors.white, fontSize: 44.sp),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  ranking.userName,
                  style: TextStyle(color: Colors.white, fontSize: 55.sp),
                ),
                SizedBox(height: 80.h),
                Text(
                  'Score: ${ranking.score}',
                  style: TextStyle(color: Colors.orange, fontSize: 44.sp),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[800]),
      child: Column(
        children: [
          SizedBox(width: 5000, height: 500, child: _buildRankingList()),
        ],
      ),
    );
  }
}
