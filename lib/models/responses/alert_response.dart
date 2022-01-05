import 'dart:convert';

class AlertResponse {
  final String id;
  final String departure;
  final String destination;
  final int wagonCount;
  final DateTime scheduleDate;
  final int status;
  final DateTime lastModifiedDate;
  final int unreadNotificationCount;
  AlertResponse({
    required this.id,
    required this.departure,
    required this.destination,
    required this.wagonCount,
    required this.scheduleDate,
    required this.status,
    required this.lastModifiedDate,
    required this.unreadNotificationCount,
  });

  factory AlertResponse.fromJson2(Map<String, dynamic> map) {
    return AlertResponse(
      id: map['id'],
      departure: map['departure'],
      destination: map['destination'],
      wagonCount: map['wagonCount'],
      scheduleDate: DateTime.parse(map['scheduleDate']),
      status: map['status'],
      lastModifiedDate: DateTime.parse(map['lastModifiedDate']),
      unreadNotificationCount: map['unreadNotificationCount'],
    );
  }

  factory AlertResponse.fromRawJson(String source) =>
      AlertResponse.fromJson2(json.decode(source));

  factory AlertResponse.fromMap(Map<String, dynamic> map) {
    return AlertResponse(
      id: map['id'] ?? '',
      departure: map['departureStationName'] ?? '',
      destination: map['destinationStationName'] ?? '',
      wagonCount: map['wagonCount']?.toInt() ?? 0,
      scheduleDate: DateTime.parse(map['startDate']),
      status: map['alertStatusType']?.toInt() ?? 0,
      lastModifiedDate: DateTime.parse(map['lastModifiedAt']),
      unreadNotificationCount: map['unreadNotificationCount']?.toInt() ?? 0,
    );
  }

  factory AlertResponse.fromJson(String source) =>
      AlertResponse.fromMap(json.decode(source));
}
