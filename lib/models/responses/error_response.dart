import 'dart:convert';

class ErrorResponse {
  final String code;
  final String message;

  ErrorResponse({
    required this.code,
    required this.message,
  });

  factory ErrorResponse.fromMap(Map<String, dynamic> map) {
    return ErrorResponse(
      code: map['code'] ?? '',
      message: map['message'] ?? '',
    );
  }

  factory ErrorResponse.fromJson(String source) =>
      ErrorResponse.fromMap(json.decode(source));
}
