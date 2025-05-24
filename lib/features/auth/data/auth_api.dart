import 'dart:convert';
import 'package:componentss/core/user_model.dart';
import 'package:componentss/core/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthApi {
  static const String baseUrl = 'http://34.64.233.128:5200/auth';

  static Future<String> registerUser(
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
      return response.body;
    } catch (e) {
      print("회원가입 오류: $e");
      return "회원가입 중 오류 발생";
    }
  }

  static Future<bool> loginUser(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );
      return true;
    } catch (e) {
      print("로그인 오류: $e");
      return false;
    }
  }

  static Future<User?> fetchUserByUsername(String username) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$username/name'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return User.fromJson(data);
      }
    } catch (e) {
      print("유저 정보 불러오기 오류: $e");
    }
    return null;
  }
}
