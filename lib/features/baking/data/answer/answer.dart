class Answer {
  final String? question; // 질문 (null 가능)
  final String answer; // 답변

  Answer({required this.question, required this.answer});

  // JSON 데이터를 Answer 객체로 변환
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      question: json['question'] as String?, // null 가능
      answer: json['answer'] as String,
    );
  }

  // Answer 객체를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {'question': question, 'answer': answer};
  }
}
