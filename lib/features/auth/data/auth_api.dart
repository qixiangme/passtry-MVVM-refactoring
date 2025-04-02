import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApi {
  final String baseUrl = "http://34.64.233.128:5200/"; //후에 수정

  // 회원가입 API
  Future<String> registerUser(
    String username,
    String email,
    String password,
  ) async {
    final url = Uri.parse("$baseUrl/auth/signup"); // baseUrl 사용

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return "회원가입 성공!";
    } else {
      return jsonDecode(response.body)["message"]; // 실패 이유 반환
    }
  }

  // 로그인 API
  Future<String> loginUser(String username, String password) async {
    final url = Uri.parse("$baseUrl/api/auth/login"); // baseUrl 사용

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      return "로그인 성공! 토큰"; // JWT 토큰 저장 필요
    } else {
      return jsonDecode(response.body)["message"]; // 실패 이유 반환
    }
  }
}
