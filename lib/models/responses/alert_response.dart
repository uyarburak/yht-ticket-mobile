import 'dart:convert';

class AlertResponse {
  final String id;
  final String departure;
  final String destination;
  final int wagonCount;
  final DateTime scheduleDate;
  AlertResponse({
    required this.id,
    required this.departure,
    required this.destination,
    required this.wagonCount,
    required this.scheduleDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departure': departure,
      'destination': destination,
      'wagonCount': wagonCount,
      'scheduleDate': scheduleDate.millisecondsSinceEpoch,
    };
  }

  factory AlertResponse.fromJson(Map<String, dynamic> map) {
    return AlertResponse(
      id: map['id'],
      departure: map['departure'],
      destination: map['destination'],
      wagonCount: map['wagonCount'],
      scheduleDate: DateTime.fromMillisecondsSinceEpoch(map['scheduleDate']),
    );
  }

  String toRawJson() => json.encode(toJson());

  factory AlertResponse.fromRawJson(String source) =>
      AlertResponse.fromJson(json.decode(source));
}
