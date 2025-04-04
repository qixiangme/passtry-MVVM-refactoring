import 'dart:convert';
import 'package:componentss/features/baking/data/attendance_model.dart';
import 'package:http/http.dart' as http;

class AttendanceApi {
  final String baseUrl = "http://34.64.233.128:5200"; // 서버 URL

  Future<bool> checkAttendance(String userId) async {
    final url = Uri.parse("$baseUrl/attendances/today?userId=$userId");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data; // 서버에서 'attended' 필드로 출석 여부 반환
      } else {
        print("Error: ${response.statusCode}, ${response.body}");
        return false; // 실패 시 기본값 반환
      }
    } catch (e) {
      print("GET 요청 실패: $e");
      return false; // 네트워크 오류 시 기본값 반환
    }
  }

  Future<List<Attendance>> fetchAttendanceHistory(String userId) async {
    final url = Uri.parse(
      'http://34.64.233.128:5200/attendances/history?userId=$userId',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Attendance.fromJson(json)).toList();
    } else {
      throw Exception('출석 기록을 불러오지 못했습니다.');
    }
  }
}
