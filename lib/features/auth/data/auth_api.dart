import 'dart:convert';
import 'package:componentss/features/auth/data/user_model.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  final String baseUrl = "http://34.64.233.128:5200/"; //후에 수정

  // 회원가입 API
  Future<String> registerUser(User user) async {
    final url = Uri.parse("$baseUrl/auth/signup"); // baseUrl 사용

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": user.username,
        "email": user.email,
        "password": user.password,
      }),
    );

    if (response.statusCode == 200) {
      return "회원가입 성공!";
    } else {
      return jsonDecode(response.body)["message"] ?? "알 수 없는 오류 발생"; // 실패 이유 반환
    }
  }

  // 로그인 API
  Future<String> loginUser(String username, String password) async {
    final url = Uri.parse("$baseUrl/auth/login"); // baseUrl 사용

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password": password}),
      );

      if (response.statusCode == 200) {
        return "로그인 성공!"; // JWT 토큰 저장 필요
      } else {
        return jsonDecode(response.body) ?? "알수없는 오류"; // 실패 이유 반환
      }
    } catch (e) {
      // 네트워크 오류 또는 기타 예외 처리
      print("로그인 중 오류 발생: $e");
      return "로그인 중 오류가 발생했습니다.";
    }
  }
}
