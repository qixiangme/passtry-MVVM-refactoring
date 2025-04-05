class RankingModel {
  final String userId;
  final String userName;
  final int score;
  final int rank;

  RankingModel({
    required this.userId,
    required this.userName,
    required this.score,
    required this.rank,
  });

  factory RankingModel.fromJson(Map<String, dynamic> json) {
    return RankingModel(
      userId: json['userId'],
      userName: json['userName'],
      score: json['score'],
      rank: json['rank'],
    );
  }
}
