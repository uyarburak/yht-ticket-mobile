import 'dart:convert';

class StationResponse {
  final int id;
  final String code;
  final String name;
  late String nameLower;
  StationResponse({
    required this.id,
    required this.code,
    required this.name,
  }) {
    nameLower = name.toLowerCase();
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'code': code, 'name': name};
  }

  factory StationResponse.fromMap(Map<String, dynamic> map) {
    return StationResponse(id: map['id'], code: map['code'], name: map['name']);
  }

  String toJson() => json.encode(toMap());

  factory StationResponse.fromJson(String source) =>
      StationResponse.fromMap(json.decode(source));
}
