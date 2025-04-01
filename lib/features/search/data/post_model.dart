class PostModel {
  final String title;
  final String description;
  final String imageUrl;
  final String sort;

  PostModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.sort
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json["title"],
      description: json["description"],
      imageUrl: json["imageUrl"] ?? "",
      sort: json["sort"],
    );
  }
}
