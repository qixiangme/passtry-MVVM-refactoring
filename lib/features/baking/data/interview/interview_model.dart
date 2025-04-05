class Interview {
  final String userId;
  final String name;
  final String category;
  final List<String> tags;
  final String date; // yyyy-MM-dd
  final String time; // HH:mm:ss
  final String questDifficulty;
  final bool includeTrendQuiz;

  Interview({
    required this.userId,
    required this.name,
    required this.category,
    required this.tags,
    required this.date,
    required this.time,
    required this.questDifficulty,
    required this.includeTrendQuiz,
  });

  factory Interview.fromJson(Map<String, dynamic> json) {
    return Interview(
      userId: json['userId'],
      name: json['name'],
      category: json['category'],
      tags: List<String>.from(json['tags']),
      date: json['date'],
      time: json['time'],
      questDifficulty: json['questDifficulty'],
      includeTrendQuiz: json['includeTrendQuiz'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'category': category,
      'tags': tags,
      'date': date,
      'time': time,
      'questDifficulty': questDifficulty,
      'includeTrendQuiz': includeTrendQuiz,
    };
  }
}
