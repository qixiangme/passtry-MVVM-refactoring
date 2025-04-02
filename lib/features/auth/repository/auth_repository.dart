// repository/auth_repository.dart
import 'package:componentss/features/auth/data/auth_api.dart';
import 'package:componentss/features/auth/data/user_model.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  // 회원가입
  Future<AuthResponse> register(User user) async {
    try {
      final response = await authApi.registerUser(user);
      return response;
    } catch (e) {
      throw Exception("회원가입 실패: $e");
    }
  }

  // 로그인
  Future<AuthResponse> login(String username, String password) async {
    try {
      final response = await authApi.loginUser(username, password);
      return response;
    } catch (e) {
      throw Exception("로그인 실패: $e");
    }
  }
}
