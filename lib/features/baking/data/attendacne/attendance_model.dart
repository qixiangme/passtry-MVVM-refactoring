class Attendance {
  final String userId;
  final String date;
  final String id;
  final bool oddMissionCompleted;
  final bool evenMissionCompleted;
  final bool attendanceSatisfied;

  Attendance({
    required this.userId,
    required this.date,
    required this.id,
    required this.oddMissionCompleted,
    required this.evenMissionCompleted,
    required this.attendanceSatisfied,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      userId: json['userId'],
      date: json['date'],
      id: json['id'],
      oddMissionCompleted: json['oddMissionCompleted'],
      evenMissionCompleted: json['evenMissionCompleted'],
      attendanceSatisfied: json['attendanceSatisfied'],
    );
  }
}
