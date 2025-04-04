import 'dart:convert';
import 'package:componentss/features/baking/data/mission_response_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://34.64.233.128:5200';

Future<MissionResponse> fetchNextMissions(String userId) async {
  final url = Uri.parse('$baseUrl/missions/next?userId=$userId');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return MissionResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('미션을 불러오지 못했습니다.');
  }
}

Future<void> completeMission({
  required String userId,
  required int stage,
  required int index,
}) async {
  final url = Uri.parse(
      '$baseUrl/missions/complete?userId=$userId&stage=$stage&index=$index');

  final response = await http.post(url);

  if (response.statusCode == 200) {
    print('미션 완료 성공');
  } else {
    throw Exception('미션 완료 실패');
  }
}

// void getMissions() async {
//   try {
//     final missionResponse = await fetchNextMissions("0");
//     print("ODD 미션: ${missionResponse.oddMission.title}");
//     print("EVEN 미션: ${missionResponse.evenMission.title}");
//     print("랜덤 질문: ${missionResponse.question}");
//   } catch (e) {
//     print("에러 발생: $e");
//   }
// }

// void completeSampleMission() async {
//   try {
//     await completeMission(userId: "0", stage: 1, index: 0);
//   } catch (e) {
//     print("미션 완료 실패: $e");
//   }
// }