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
}
