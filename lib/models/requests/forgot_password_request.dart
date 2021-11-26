import 'dart:convert';

class ForgotPasswordRequest {
  ForgotPasswordRequest({
    required this.email,
  });

  String email;

  factory ForgotPasswordRequest.fromRawJson(String str) =>
      ForgotPasswordRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordRequest(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
