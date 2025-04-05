
import 'package:componentss/features/baking/data/mission/mission_model.dart';

class MissionResponse {
  final Mission nextOddMission;
  final Mission nextEvenMission;
  final String? randomAnsweredOddQuestion;

  MissionResponse({
    required this.nextOddMission,
    required this.nextEvenMission,
    required this.randomAnsweredOddQuestion,
  });

  factory MissionResponse.fromJson(Map<String, dynamic> json) {
    return MissionResponse(
      nextOddMission: Mission.fromJson(json['nextOddMission']),
      nextEvenMission: Mission.fromJson(json['nextEvenMission']),
      randomAnsweredOddQuestion: json['randomAnsweredOddQuestion'],
    );
  }
}