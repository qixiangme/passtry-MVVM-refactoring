class Mission {
  final String id;
  final int stage;
  final int index;
  final String question;
  final String type;

  Mission({
    required this.id,
    required this.stage,
    required this.index,
    required this.question,
    required this.type,
  });

  // JSON 데이터를 Dart 객체로 변환
  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'],
      stage: json['stage'],
      index: json['index'],
      question: json['question'],
      type: json['type'],
    );
  }
}
