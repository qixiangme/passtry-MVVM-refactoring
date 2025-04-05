// services/interview_api.dart

import 'dart:convert';
import 'package:componentss/features/baking/data/interview/interview_model.dart';
import 'package:http/http.dart' as http;

class InterviewApi {
  static const String baseUrl = 'http://34.64.233.128:5200';

  // 인터뷰 생성 (POST)
  static Future<bool> postInterview(InterviewModel interview) async {
    try {
      // 요청 데이터 변환
      final Map<String, dynamic> requestData = interview.toJson();

      // POST 요청
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json; charset=utf-8', // UTF-8 설정
        },
        body: jsonEncode(requestData),
      );
      final decodedBody = utf8.decode(response.bodyBytes);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // 특정 유저의 인터뷰 목록 가져오기 (GET)
  static Future<List<InterviewModel>> getInterviewsByUser(String userId) async {
    try {
      // 요청 URL 출력
      final url = Uri.parse('$baseUrl/interviews/user/$userId');

      // GET 요청
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      // 응답 상태 코드 및 헤더 출력

      // 응답 본문 디코딩
      final decodedBody = utf8.decode(response.bodyBytes);

      if (response.statusCode == 200) {
        // JSON 파싱
        final List<dynamic> jsonList = jsonDecode(decodedBody);

        // 인터뷰 모델로 변환
        return jsonList.map((e) => InterviewModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<int?> getInterviewDday(String interviewId) async {
    try {
      // 요청 URL 생성
      final url = Uri.parse('$baseUrl/interviews/dday/$interviewId');
      print("📤 요청 URL: $url");

      // GET 요청
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      // 응답 상태 코드 및 본문 출력
      print("📥 응답 상태 코드: ${response.statusCode}");
      final decodedBody = utf8.decode(response.bodyBytes);
      print("📥 응답 본문: $decodedBody");

      if (response.statusCode == 200) {
        // 응답 본문이 숫자인 경우 바로 반환
        final int dday = int.parse(decodedBody);
        print("✅ D-Day 데이터 로드 성공: $dday");
        return dday;
      } else {
        print("❌ D-Day 조회 실패: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("🚨 D-Day 가져오기 오류: $e");
      return null;
    }
  }
}
