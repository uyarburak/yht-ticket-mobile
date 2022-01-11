import 'dart:convert';

class ForgotPasswordRequest {
  final String email;

  ForgotPasswordRequest({
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  String toJson() => json.encode(toMap());
}
