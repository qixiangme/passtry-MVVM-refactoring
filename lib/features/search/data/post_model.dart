import 'dart:io';

class PostModel {
  final String userId;
  final String title;
  final String content;
  final File? images; // 이미지 파일 리스트 (전송용)
  final String? imageUrl; // 서버에서 받아온 이미지 URL
  final String id;
  final String createdAt;
  final int views;
  final List<String> tags;

  PostModel(
    this.userId,
    this.createdAt,
    this.views,
    this.tags, {
    required this.title,
    required this.content,
    this.images, // 선택적 필드로 설정
    this.imageUrl, // 선택적 필드로 설정
    required this.id,
  });

  // JSON 데이터를 PostModel 객체로 변환하는 메서드
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      json['userId'] as String,
      json['createdAt'] as String,
      json['views'] as int,
      List<String>.from(json['tags'] ?? []), // null이면 빈 리스트 반환
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String?, // 서버에서 반환된 이미지 URL
      id: json['id'] as String,
    );
  }

  // PostModel 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    print(images?.path);
    return {
      'userId': userId,
      'title': title,
      'content': content,
      'imageUrl': imageUrl, // 서버에서 반환된 이미지 URL만 포함
      'id': id,
      'createdAt': createdAt,
      'views': views,
      'tags': tags,
    };
  }
}
