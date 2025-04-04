class User {
  final String username;
  final String email;
  final List<String> joinedGroups; // 참가 그룹 리스트

  User({
    required this.username,
    required this.email,
    this.joinedGroups = const [], // 기본값은 빈 리스트
  });

  // JSON → 객체 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      joinedGroups: List<String>.from(json['joinedGroups'] ?? []),
    );
  }

  // 객체 → JSON 변환
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'joinedGroups': joinedGroups,
    };
  }
}