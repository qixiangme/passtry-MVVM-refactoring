class User {
  final String username;
  final String email;
  final String password;

  User({required this.username, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}

class AuthResponse {
  final String token;
  final String userId;

  AuthResponse({required this.token, required this.userId});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      userId: json['userId'],
    );
  }
}
