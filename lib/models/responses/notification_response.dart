import 'dart:convert';

class NotificationResponse {
  final String id;
  final int notificationType;
  final String message;
  final DateTime date;

  NotificationResponse({
    required this.id,
    required this.notificationType,
    required this.message,
    required this.date,
  });

  factory NotificationResponse.fromRawJson(String str) =>
      NotificationResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'id': id,
        'notificationType': notificationType,
        'message': message,
        'date': date,
      };

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      id: json['id'] as String,
      notificationType: json['notificationType'] as int,
      message: json['message'] as String,
      date: json['date'] as DateTime,
    );
  }

  @override
  String toString() =>
      'NotificationResponse(id: $id, notificationType: $notificationType, message: $message, date: $date)';
}
