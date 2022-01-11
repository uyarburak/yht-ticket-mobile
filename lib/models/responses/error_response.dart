import 'dart:convert';

class ErrorResponse {
  final String code;
  final String message;
  ErrorResponse({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
    };
  }

  factory ErrorResponse.fromMap(Map<String, dynamic> map) {
    return ErrorResponse(
      code: map['code'] ?? '',
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorResponse.fromJson(String source) =>
      ErrorResponse.fromMap(json.decode(source));
}
