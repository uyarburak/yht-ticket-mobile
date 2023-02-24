import 'dart:convert';

class RegisterResponse {
  final String username;
  RegisterResponse({
    required this.username,
  });
  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      username: map['username'] ?? '',
    );
  }

  factory RegisterResponse.fromJson(String source) =>
      RegisterResponse.fromMap(json.decode(source));
}
