import 'dart:convert';

class LoginResponse {
  final String token;
  final String username;
  final String email;
  final String name;
  final String surname;
  final String avatarUrl;
  final bool isGuest;

  LoginResponse({
    required this.token,
    required this.username,
    required this.email,
    required this.name,
    required this.surname,
    required this.avatarUrl,
    required this.isGuest,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'username': username,
      'email': email,
      'name': name,
      'surname': surname,
      'avatarUrl': avatarUrl,
      'isGuest': isGuest,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      token: map['token'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
      isGuest: map['isGuest'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));
}
