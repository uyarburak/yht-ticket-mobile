import 'dart:convert';

class LoginRequest {
  final String usernameOrEmail;
  final String password;

  LoginRequest({
    required this.usernameOrEmail,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'usernameOrEmail': usernameOrEmail,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
