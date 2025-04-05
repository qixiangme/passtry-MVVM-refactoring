import 'dart:convert';
import 'package:componentss/core/user_model.dart';
import 'package:componentss/core/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApi {
  static const String baseUrl = 'http://34.64.233.128:5200/auth'; // 서버 주소 변경

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

      if (response.statusCode == 200) {
        // 로그인 성공 시, 사용자 정보 받아오기
        final userResponse = await http.get(
          Uri.parse('$baseUrl/users/$username/name'),
          headers: {'Content-Type': 'application/json'},
        );

        if (userResponse.statusCode == 200) {
          final userData = jsonDecode(userResponse.body);
          final user = User.fromJson(userData);

          // Provider와 SharedPreferences에 저장
          Provider.of<UserProvider>(context, listen: false).setUser(user);
          await saveUser(user);

          print("로그인 성공 및 사용자 정보 설정 완료");
          return true;
        } else {
          print("사용자 정보를 가져오는 데 실패: ${userResponse.statusCode}");
          return false;
        }
      } else {
        print("로그인 실패: ${response.statusCode}");
        return false;
      }
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
  static Future<User?> getUserById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return User.fromJson(data);
      } else {
        print("사용자 정보를 가져오지 못했습니다. 상태 코드: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("getUser API 호출 중 오류 발생: $e");
      return null;
    }
  }

  // 로그아웃 (저장된 정보 삭제)
  static Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    Provider.of<UserProvider>(context, listen: false).logout();
  }
}
