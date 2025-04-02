class PostModel {
  final String userId;
  final String title;
  final String content;
  final String? imageUrl;
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
    this.imageUrl,
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
      imageUrl:
          json['imageUrl'] != null
              ? json['imageUrl'] as String
              : null, // null 처리
      id: json['id'] as String,
    );
  }

  // PostModel 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'id': id,
      'createdAt': createdAt,
      'views': views,
      'tags': tags,
    };
  }
}
