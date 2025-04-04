import 'dart:convert';
import 'package:componentss/features/auth/data/user_model.dart';
import 'package:componentss/features/auth/data/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApi {
  static const String baseUrl = 'http://your-server.com/auth'; // 서버 주소 변경

  // 회원가입 API 호출
  static Future<bool> registerUser(
    BuildContext context,
    String username,
    String password,
    String email,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'email': email,
        }),
      );

      return true;
    } catch (e) {
      print("회원가입 중 오류 발생: $e");
      return false;
    }
  }

  // 로그인 API 호출
  static Future<bool> loginUser(
    BuildContext context,
    String username,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      // User 객체 생성
      final user = User(
        username: username,
        email: "data['email']",
        joinedGroups: [],
      );

      // UserProvider를 통해 사용자 정보 설정
      Provider.of<UserProvider>(context, listen: false).setUser(user);

      // 사용자 정보 내부 저장
      await saveUser(user);

      print("로그인 성공");
      return true;
    } catch (e) {
      print("로그인 중 오류 발생: $e");
      return false;
    }
  }

  // 내부 저장 (SharedPreferences)
  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

  // 저장된 사용자 가져오기
  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');
    if (userData != null) {
      return User.fromJson(jsonDecode(userData));
    }
    return null;
  }

  // 로그아웃 (저장된 정보 삭제)
  static Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    Provider.of<UserProvider>(context, listen: false).logout();
  }
}
