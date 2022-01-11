import 'dart:convert';

class AlertResponse {
  final String id;
  final String departureStationName;
  final String destinationStationName;
  final int wagonCount;
  final DateTime startDate;
  final int alertStatusType;
  final DateTime lastModifiedAt;
  final int unreadNotificationCount;

  AlertResponse({
    required this.id,
    required this.departureStationName,
    required this.destinationStationName,
    required this.wagonCount,
    required this.startDate,
    required this.alertStatusType,
    required this.lastModifiedAt,
    required this.unreadNotificationCount,
  });

  factory AlertResponse.fromMap(Map<String, dynamic> map) {
    return AlertResponse(
      id: map['id'] ?? '',
      departureStationName: map['departureStationName'] ?? '',
      destinationStationName: map['destinationStationName'] ?? '',
      wagonCount: map['wagonCount']?.toInt() ?? 0,
      startDate: DateTime.parse(map['startDate']),
      alertStatusType: map['alertStatusType']?.toInt() ?? 0,
      lastModifiedAt: DateTime.parse(map['lastModifiedAt']),
      unreadNotificationCount: map['unreadNotificationCount']?.toInt() ?? 0,
    );
  }

  factory AlertResponse.fromJson(String source) =>
      AlertResponse.fromMap(json.decode(source));
}
