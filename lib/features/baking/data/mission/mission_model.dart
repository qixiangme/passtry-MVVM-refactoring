class Mission {
  final String id;
  final int stage;
  final int index;
  final String question;
  final String type; // "ODD" 또는 "EVEN"

  Mission({
    required this.id,
    required this.stage,
    required this.index,
    required this.question,
    required this.type,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'] ?? "",
      stage: json['stage'] ?? 0,
      index: json['index'] ?? 0,
      question: json['question'] ?? "",
      type: json['type'] ?? "",
    );
  }
}
