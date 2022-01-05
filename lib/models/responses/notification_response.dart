import 'dart:convert';

import 'package:flutter/foundation.dart';

class NotificationResponse {
  final int notificationType;
  final Map<String, Object> payload;
  final DateTime createdAt;
  NotificationResponse({
    required this.notificationType,
    required this.payload,
    required this.createdAt,
  });

  factory NotificationResponse.fromMap(Map<String, dynamic> map) {
    return NotificationResponse(
      notificationType: map['notificationType']?.toInt() ?? 0,
      payload: Map<String, Object>.from(map['payload']),
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  factory NotificationResponse.fromJson(String source) =>
      NotificationResponse.fromMap(json.decode(source));
}
