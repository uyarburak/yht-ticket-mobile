import 'dart:convert';

class CreateAlertsRequest {
  final List<CreateAlertRequest> alerts;
  CreateAlertsRequest({
    required this.alerts,
  });

  String toJson() => json.encode(alerts.map((x) => x.toMap()).toList());
}

class CreateAlertRequest {
  final int scheduleId;
  final String departureStationName;
  final String destinationStationName;
  final DateTime startDate;
  final DateTime endDate;
  final List<int> wagons;

  CreateAlertRequest({
    required this.scheduleId,
    required this.departureStationName,
    required this.destinationStationName,
    required this.startDate,
    required this.endDate,
    required this.wagons,
  });

  Map<String, dynamic> toMap() {
    return {
      'scheduleId': scheduleId,
      'departureStationName': departureStationName,
      'destinationStationName': destinationStationName,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'wagons': wagons,
    };
  }

  String toJson() => json.encode(toMap());
}
