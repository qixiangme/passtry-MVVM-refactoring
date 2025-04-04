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

  // 참가 그룹 추가
  void addGroup(String groupId) {
    if (_user != null) {
      _user = User(
        username: _user!.username,
        email: _user!.email,
        joinedGroups: [..._user!.joinedGroups, groupId], // 그룹 추가
      );
      notifyListeners(); // 상태 변경 알림
    }
  }

  // 사용자 로그아웃
  void logout() {
    _user = null;
    notifyListeners(); // 상태 변경 알림
  }
}