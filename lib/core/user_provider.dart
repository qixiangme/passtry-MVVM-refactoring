import 'dart:convert';

import 'package:componentss/features/study/data/group_model.dart';
import 'package:componentss/features/study/data/tempGroup.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  // 사용자 정보 설정
  void setUser(User user) {
    _user = user;
    notifyListeners(); // 상태 변경 알림
  }

  Future<String> login(String email, String password) async {
    final url = Uri.parse('http://34.64.233.128:5200/auth/login');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": email, "password": password}),
    );

    if (response.statusCode == 200) {
      if (response.body == "Login successful!") {
        _user = User(username: email, email: email, score: 0);
        notifyListeners(); // UI 업데이트
        return "로그인 성공!";
      } else {
        return response.body; // 실패 메시지 반환
      }
    } else {
      return "로그인 실패!";
    }
  }

  // 참가 그룹 추가
  void addGroup(GroupModel group) {
    if (_user != null) {
      _user = User(
        username: _user!.username,
        score: _user!.score,
        email: _user!.email,
        joinedGroups: [..._user!.joinedGroups, group], // 그룹 추가
      );
      notifyListeners(); // 상태 변경 알림
    }
  }

  // 사용자 로그아웃
  void logout() {
    _user = null;
    notifyListeners(); // 상태 변경 알림
  }

  Future<String> signUp(String username, String password, String email) async {
    final url = Uri.parse('http://34.64.233.128:5200/auth/signup');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
        "email": email,
      }),
    );

    if (response.statusCode == 200) {
      if (response.body == "Registration successful!") {
        _user = User(username: username, email: email, score: 0);
        notifyListeners(); // UI 업데이트
        return "회원가입 성공!";
      } else {
        return response.body; // 실패 메시지 반환
      }
    } else {
      return "회원가입 실패!";
    }
  }
}
