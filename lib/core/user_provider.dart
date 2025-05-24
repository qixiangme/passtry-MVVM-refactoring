import 'dart:convert';
import 'package:componentss/features/auth/data/auth_api.dart';
import 'package:componentss/features/study/data/group_model.dart';
import 'package:componentss/core/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
class UserProvider extends StateNotifier<User?> {
  UserProvider() : super(null);

  Future<String> signUp(String username, String password, String email) async {
    final result = await AuthApi.registerUser(username, password, email);

    if (result == "Registration successful!") {
      state = User(username: username, email: email, score: 0);
      return "회원가입 성공!";
    } else {
      return result;
    }
  }

  Future<bool> login(String username, String password) async {
    final loginResult = await AuthApi.loginUser(username, password);

    if (loginResult == "Login successful!") {
      final user = await AuthApi.fetchUserByUsername(username);
      if (user != null) {
        state = user;
        return true;
      }
      return false;
    } else {
      return loginResult;
    }
  }

  void logout() {
    state = null;
  }

  void addGroup(GroupModel group) {
    if (state != null) {
      state = User(
        username: state!.username,
        email: state!.email,
        score: state!.score,
        joinedGroups: [...state!.joinedGroups, group],
      );
    }
  }
}

final userProvider = StateNotifierProvider<UserProvider, User?>(
  (ref) => UserProvider(),
);
