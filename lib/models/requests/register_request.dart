import 'dart:convert';

class RegisterRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String password;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'username': username,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
