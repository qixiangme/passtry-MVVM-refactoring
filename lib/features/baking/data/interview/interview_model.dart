// models/interview_model.dart

import 'dart:convert';

class InterviewModel {
  final String? id;
  final String userId;
  final String name;
  final String category;
  final List<String> tags;
  final int score;
  final int level;
  final String date;
  final String time; // 서버에서는 LocalTime으로 들어오므로 String 처리
  final String questDifficulty;
  final bool includeTrendQuiz;

  InterviewModel({
    this.id,
    required this.userId,
    required this.name,
    required this.category,
    required this.tags,
    this.score = 0,
    this.level = 0,
    required this.date,
    required this.time,
    required this.questDifficulty,
    required this.includeTrendQuiz,
  });

  factory InterviewModel.fromJson(Map<String, dynamic> json) {
    return InterviewModel(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      category: json['category'],
      tags: List<String>.from(json['tags']),
      score: json['score'],
      level: json['level'],
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
      'score': score,
      'level': level,
      'date': date,
      'time': time,
      'questDifficulty': questDifficulty,
      'includeTrendQuiz': includeTrendQuiz,
    };
  }
}
