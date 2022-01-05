import 'dart:convert';

class ScheduleResponse {
  final int id;
  final String name;
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final List<WagonType> wagonTypes;
  bool selected = false;
  ScheduleResponse({
    required this.id,
    required this.name,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.wagonTypes,
  });

  factory ScheduleResponse.fromMap(Map<String, dynamic> map) {
    return ScheduleResponse(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      wagonTypes: List<WagonType>.from(
          map['wagonTypes']?.map((x) => WagonType.fromMap(x))),
    );
  }

  factory ScheduleResponse.fromJson(String source) =>
      ScheduleResponse.fromMap(json.decode(source));
}

class WagonType {
  final String name;
  final double price;
  final List<int> wagons;
  bool selected = false;
  WagonType({
    required this.name,
    required this.price,
    required this.wagons,
  });

  factory WagonType.fromMap(Map<String, dynamic> map) {
    return WagonType(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      wagons: List<int>.from(map['wagons']),
    );
  }

  factory WagonType.fromJson(String source) =>
      WagonType.fromMap(json.decode(source));
}
