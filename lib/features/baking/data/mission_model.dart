class Mission {
  final String id;
  final int stage;
  final int index;
  final String title;
  final String description;
  final String type; // "ODD" 또는 "EVEN"

  Mission({
    required this.id,
    required this.stage,
    required this.index,
    required this.title,
    required this.description,
    required this.type,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'],
      stage: json['stage'],
      index: json['index'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
    );
  }
}
