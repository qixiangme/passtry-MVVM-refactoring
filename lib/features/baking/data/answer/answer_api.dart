import 'dart:convert';
import 'package:http/http.dart' as http;
import 'answer.dart';

class AnswerApi {
  static const String baseUrl = 'http://34.64.233.128:5200';

  // 특정 userId의 답변 데이터를 가져오는 함수
  static Future<List<Answer>> fetchAnswersByUserId(String userId) async {
    try {
      final url = Uri.parse('$baseUrl/answers?userId=$userId');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        final List<dynamic> jsonList = json.decode(decodedBody);

        // JSON 데이터를 Answer 객체 리스트로 변환
        return jsonList.map((json) => Answer.fromJson(json)).toList();
      } else {
        print('❌ 응답 실패: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('🚨 오류 발생: $e');
      return [];
    }
  }
}