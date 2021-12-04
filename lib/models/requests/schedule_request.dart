import 'dart:convert';

class ScheduleRequest {
  final String departure;
  final String destination;
  final DateTime departureDate;
  ScheduleRequest({
    required this.departure,
    required this.destination,
    required this.departureDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'departure': departure,
      'destination': destination,
      'departureDate': departureDate.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());
}
