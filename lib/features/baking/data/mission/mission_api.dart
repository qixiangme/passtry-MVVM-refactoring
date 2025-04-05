import 'dart:convert';
import 'dart:math';
import 'package:componentss/features/baking/data/mission/mission_model.dart';
import 'package:componentss/features/baking/data/mission/mission_response_model.dart';
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

Future<void> submitAnswer({
  required String userId,
  required String missionId,
  required String content,
}) async {
  final url = Uri.parse(
    '$baseUrl/answers/submit'
    '?userId=$userId'
    '&missionId=$missionId'
    '&content=${Uri.encodeComponent(content)}', // content는 꼭 인코딩!
  );
  final response = await http.post(url); // body 필요 없음

  if (response.statusCode == 200) {
    print('답변 제출 성공');
  } else {
    print('답변 제출 실패');
    print('응답 코드: ${response.statusCode}');
    print('응답 헤더: ${response.headers}');
    print('응답 내용: ${response.body}');

    throw Exception('답변 제출 중 오류 발생');
  }
}

Future<void> completeMission({
  required String userId,
  required int stage,
  required int index,
}) async {
  final url = Uri.parse(
    '$baseUrl/missions/complete'
    '?userId=$userId'
    '&stage=$stage'
    '&index=$index',
  );

  final response = await http.post(url); // body 없이 POST만

  if (response.statusCode == 200) {
    print('미션 완료 처리 성공');
  } else {
    print('미션 완료 처리 실패');
    print('응답 코드: ${response.statusCode}');
    print('응답 내용: ${response.body}');
    throw Exception('미션 완료 처리 중 오류 발생');
  }
}


