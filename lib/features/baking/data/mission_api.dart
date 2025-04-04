import 'dart:convert';
import 'package:componentss/features/baking/data/mission_model.dart';
import 'package:componentss/features/baking/data/mission_response_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://34.64.233.128:5200';

// MissionResponse를 받아오는 함수
Future<MissionResponse> fetchNextMissions(String userId) async {
  final url = Uri.parse('$baseUrl/missions/next?userId=$userId');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final decodedBody = utf8.decode(response.bodyBytes);
    return MissionResponse.fromJson(json.decode(decodedBody));
  } else {
    throw Exception('미션을 불러오지 못했습니다.');
  }
}

// ODD 미션을 받아오는 함수
Future<Mission> fetchOddMission(String missionId) async {
  final url = Uri.parse('$baseUrl/missions/odd/$missionId');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return Mission.fromJson(json.decode(response.body));
  } else {
    throw Exception('ODD 미션을 불러오지 못했습니다.');
  }
}

// EVEN 미션을 받아오는 함수
Future<Mission> fetchEvenMission(String missionId) async {
  final url = Uri.parse('$baseUrl/missions/even/$missionId');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return Mission.fromJson(json.decode(response.body));
  } else {
    throw Exception('EVEN 미션을 불러오지 못했습니다.');
  }
}
