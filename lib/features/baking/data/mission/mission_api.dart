import 'dart:convert';
import 'dart:math';
import 'package:componentss/features/baking/data/mission/mission_model.dart';
import 'package:componentss/features/baking/data/mission/mission_response_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://34.64.233.128:5200';

// MissionResponse를 받아오는 함수
Future<MissionResponse> fetchNextMissions(
  String userId,
  String interviewid,
) async {
  final url = Uri.parse(
    '$baseUrl/missions/daily?userId=$userId&interviewId=$interviewid',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final decodedBody = utf8.decode(response.bodyBytes);
    return MissionResponse.fromJson(json.decode(decodedBody));
  } else {
    print('❌ 미션 API 호출 실패');
    print('응답 코드: ${response.statusCode}');
    print('응답 내용: ${response.body}');
    throw Exception('미션을 불러오지 못했습니다.');
  }
}

// ODD 미션을 받아오는 함수
// Future<Mission> fetchOddMission(String missionId) async {
//   final url = Uri.parse('$baseUrl/missions/odd/$missionId');

//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     return Mission.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('ODD 미션을 불러오지 못했습니다.');
//   }
// }

// // EVEN 미션을 받아오는 함수
// Future<Mission> fetchEvenMission(String missionId) async {
//   final url = Uri.parse('$baseUrl/missions/even/$missionId');

//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     return Mission.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('EVEN 미션을 불러오지 못했습니다.');
//   }
// }

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
  required String interviewId,
  required int index,
}) async {
  final url = Uri.parse(
    '$baseUrl/missions/complete'
    '?userId=$userId'
    '&interviewId=$interviewId'
    '&stage=$stage'
    '&index=$index',
  );

  // 요청 URL 및 파라미터 디버깅

  try {
    final response = await http.post(url); // body 없이 POST 요청

    // 응답 상태 코드 확인
    if (response.statusCode == 200) {
      print('✅ 미션 완료 처리 성공');
    } else {
      print('❌ 미션 완료 처리 실패');
      print('응답 코드: ${response.statusCode}');
      print('응답 내용: ${response.body}');
      throw Exception('미션 완료 처리 중 오류 발생');
    }
  } catch (e) {
    print('🚨 네트워크 요청 중 오류 발생: $e');
    throw Exception('미션 완료 처리 중 네트워크 오류 발생');
  }
}

Future<void> updateMissionScore({
  required String userId,
  required String interviewId,
  required int points,
}) async {
  final url = Uri.parse(
    '$baseUrl/missions/score/$userId/$interviewId?points=$points',
  );

  try {
    final response = await http.post(url); // body 없이 POST 요청

    if (response.statusCode == 200) {
      print('✅ 포인트 업데이트 성공');
    } else {
      print('❌ 포인트 업데이트 실패');
      print('응답 코드: ${response.statusCode}');
      print('응답 내용: ${response.body}');
      throw Exception('포인트 업데이트 중 오류 발생');
    }
  } catch (e) {
    print('🚨 네트워크 요청 중 오류 발생: $e');
    throw Exception('포인트 업데이트 중 네트워크 오류 발생');
  }
}

Future<int> getTodayScore(String userId) async {
  final url = Uri.parse('$baseUrl/missions/score/$userId');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // 응답 본문을 정수로 변환하여 반환
      final score = int.parse(response.body);
      print('✅ 오늘 점수 가져오기 성공: $score');
      return score;
    } else {
      print('❌ 오늘 점수 가져오기 실패');
      print('응답 코드: ${response.statusCode}');
      print('응답 내용: ${response.body}');
      throw Exception('오늘 점수를 가져오는 중 오류 발생');
    }
  } catch (e) {
    print('🚨 네트워크 요청 중 오류 발생: $e');
    throw Exception('오늘 점수를 가져오는 중 네트워크 오류 발생');
  }
}
