import 'dart:convert';

class LoginAsGuestRequest {
  final String username;

  LoginAsGuestRequest({required this.username});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
    };
  }

  String toJson() => json.encode(toMap());
}
