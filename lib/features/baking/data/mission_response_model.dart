import 'package:componentss/features/baking/data/mission_model.dart';


class MissionResponse {
  final Mission oddMission;
  final Mission evenMission;
  final String? question;

  MissionResponse({
    required this.oddMission,
    required this.evenMission,
    required this.question,
  });

  factory MissionResponse.fromJson(Map<String, dynamic> json) {
    return MissionResponse(
      oddMission: Mission.fromJson(json['oddMission']),
      evenMission: Mission.fromJson(json['evenMission']),
      question: json['question'],
    );
  }
}
