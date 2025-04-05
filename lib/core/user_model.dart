import 'package:componentss/features/study/data/group_model.dart';

class User {
  final String username;
  final String email;
  List<GroupModel> joinedGroups;
  final int score; // 참가 그룹 리스트

  User({
    required this.username,
    required this.email,
    required this.score,
    this.joinedGroups = const [], // 기본값은 빈 리스트
  });

  // JSON → 객체 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      score: json['score'] ?? 0,
      username: json['username'],
      email: json['email'],
      joinedGroups: List<GroupModel>.from(json['joinedGroups'] ?? []),
    );
  }

  // 객체 → JSON 변환
  Map<String, dynamic> toJson() {
    return {'username': username, 'email': email, 'joinedGroups': joinedGroups};
  }
}
