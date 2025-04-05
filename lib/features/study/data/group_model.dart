import 'dart:convert';

class GroupModel {
  final String id; // 그룹 ID
  final String authorId; // 작성자 ID
  final String name; // 그룹 이름
  final String joinCode; // 그룹 가입 코드
  final List<String> tags; // 태그 리스트
  final String? imageUrl; // 이미지 URL
  final List<String> memberIds; // 멤버 ID 리스트
  final int score; // 그룹 점수
  final int level; // 그룹 레벨

  GroupModel({
    required this.id,
    required this.authorId,
    required this.name,
    required this.joinCode,
    required this.tags,
    this.imageUrl,
    required this.memberIds,
    required this.score,
    required this.level,
  });

  // JSON → 객체 변환
  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'],
      authorId: json['authorId'],
      name: json['name'],
      joinCode: json['joinCode'],
      tags: List<String>.from(json['tags'] ?? []),
      imageUrl: json['imageUrl'],
      memberIds: List<String>.from(json['memberIds'] ?? []),
      score: json['score'] ?? 0,
      level: json['level'] ?? 0,
    );
  }

  // 객체 → JSON 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorId': authorId,
      'name': name,
      'joinCode': joinCode,
      'tags': tags,
      'imageUrl': imageUrl,
      'memberIds': memberIds,
      'score': score,
      'level': level,
    };
  }

  // JSON 문자열 → 객체 변환
  static GroupModel fromJsonString(String jsonString) {
    return GroupModel.fromJson(jsonDecode(jsonString));
  }

  // 객체 → JSON 문자열 변환
  String toJsonString() {
    return jsonEncode(toJson());
  }
}