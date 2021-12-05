import 'dart:convert';

class AlertResponse {
  final String id;
  final String departure;
  final String destination;
  final int wagonCount;
  final DateTime scheduleDate;
  final int status;
  final DateTime lastModifiedDate;
  AlertResponse({
    required this.id,
    required this.departure,
    required this.destination,
    required this.wagonCount,
    required this.scheduleDate,
    required this.status,
    required this.lastModifiedDate,
  });

  factory AlertResponse.fromJson(Map<String, dynamic> map) {
    return AlertResponse(
      id: map['id'],
      departure: map['departure'],
      destination: map['destination'],
      wagonCount: map['wagonCount'],
      scheduleDate: DateTime.parse(map['scheduleDate']),
      status: map['status'],
      lastModifiedDate: DateTime.parse(map['lastModifiedDate']),
    );
  }

  factory AlertResponse.fromRawJson(String source) =>
      AlertResponse.fromJson(json.decode(source));
}
