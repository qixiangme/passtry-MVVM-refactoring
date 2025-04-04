import 'dart:convert';

class GroupModel {
  final String authorId;
  final String name;
  final String? joinCode;
  final List<String> tags;
  final String? imageUrl;

  GroupModel({
    required this.authorId,
    required this.name,
  
    required this.tags,
    this.imageUrl,
     this.joinCode,
  });

  // JSON → 객체 변환
  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      authorId: json['authorId'],
      name: json['name'],
      joinCode: json['joinCode'],
      tags: List<String>.from(json['tags'] ?? []),
      imageUrl: json['imageUrl'],
    );
  }

  // 객체 → JSON 변환
  Map<String, dynamic> toJson() {
    return {
      'authorId': authorId,
      'name': name,
      'joinCode': joinCode,
      'tags': tags,
      'imageUrl': imageUrl,
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
