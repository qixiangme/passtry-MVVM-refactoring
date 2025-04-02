import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';  

class AuthApi {
  final String baseUrl = "https://yourapi.com";  //후에 수정

  // 회원가입 API
  Future<AuthResponse> registerUser(User user) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      body: json.encode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return AuthResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("회원가입 실패");
    }
  }

  // 로그인 API
  Future<AuthResponse> loginUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      body: json.encode({
        'username': username,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return AuthResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("로그인 실패");
    }
  }
}
