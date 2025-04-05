
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'interview_model.dart';

const String baseUrl = 'http://34.64.233.128:5200';

Future<void> postInterview(Interview interview) async {
  final url = Uri.parse('$baseUrl/interviews');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(interview.toJson()),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print('✅ 인터뷰 생성 성공!');
    print('응답 본문: ${response.body}');
  } else {
    print('❌ 인터뷰 생성 실패');
    print('상태 코드: ${response.statusCode}');
    print('응답 본문: ${response.body}');
  }
}

Future<List<Interview>> fetchUserInterviews(String userId) async {
  final url = Uri.parse('$baseUrl/interviews/user/$userId');

  try {
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print('✅ 인터뷰 데이터 가져오기 성공!');
      return data.map((item) => Interview.fromJson(item)).toList();
    } else {
      print('❌ 인터뷰 데이터 가져오기 실패');
      print('상태 코드: ${response.statusCode}');
      print('응답 본문: ${response.body}');
      return [];
    }
  } catch (e) {
    print('❌ 요청 중 오류 발생: $e');
    return [];
  }
}
