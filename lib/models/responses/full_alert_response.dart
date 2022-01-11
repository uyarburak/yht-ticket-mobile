import 'dart:convert';

class FullAlertResponse {
  final String id;
  final int scheduleId;
  final String departureStationName;
  final String destinationStationName;
  final DateTime startDate;
  final DateTime endDate;
  final List<int> wagons;

  final List<AlertNotification> notifications;
  final List<ScheduleWagon> scheduleWagons;

  final int unreadNotificationCount;
  final int alertStatusType;

  final DateTime createdAt;
  final String createdBy;
  final DateTime lastModifiedAt;
  final String lastModifiedBy;

  FullAlertResponse({
    required this.id,
    required this.scheduleId,
    required this.departureStationName,
    required this.destinationStationName,
    required this.startDate,
    required this.endDate,
    required this.wagons,
    required this.notifications,
    required this.scheduleWagons,
    required this.unreadNotificationCount,
    required this.alertStatusType,
    required this.createdAt,
    required this.createdBy,
    required this.lastModifiedAt,
    required this.lastModifiedBy,
  });

  factory FullAlertResponse.fromMap(Map<String, dynamic> map) {
    return FullAlertResponse(
      id: map['id'] ?? '',
      scheduleId: map['scheduleId']?.toInt() ?? 0,
      departureStationName: map['departureStationName'] ?? '',
      destinationStationName: map['destinationStationName'] ?? '',
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      wagons: List<int>.from(map['wagons']),
      notifications: List<AlertNotification>.from(
          map['notifications']?.map((x) => AlertNotification.fromMap(x))),
      scheduleWagons: List<ScheduleWagon>.from(
          map['scheduleWagons']?.map((x) => ScheduleWagon.fromMap(x))),
      unreadNotificationCount: map['unreadNotificationCount']?.toInt() ?? 0,
      alertStatusType: map['alertStatusType']?.toInt() ?? 0,
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'] ?? '',
      lastModifiedAt: DateTime.parse(map['lastModifiedAt']),
      lastModifiedBy: map['lastModifiedBy'] ?? '',
    );
  }

  factory FullAlertResponse.fromJson(String source) =>
      FullAlertResponse.fromMap(json.decode(source));
}

class AlertNotification {
  final int wagon;
  final int wagonEmptySeatsCount;
  final String seatNo;
  final int oldStatus;
  final int newStatus;
  final DateTime createdAt;

  AlertNotification({
    required this.wagon,
    required this.wagonEmptySeatsCount,
    required this.seatNo,
    required this.oldStatus,
    required this.newStatus,
    required this.createdAt,
  });

  factory AlertNotification.fromMap(Map<String, dynamic> map) {
    return AlertNotification(
      wagon: map['wagon']?.toInt() ?? 0,
      wagonEmptySeatsCount: map['wagonEmptySeatsCount']?.toInt() ?? 0,
      seatNo: map['seatNo'] ?? '',
      oldStatus: map['oldStatus']?.toInt() ?? 0,
      newStatus: map['newStatus']?.toInt() ?? 0,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  factory AlertNotification.fromJson(String source) =>
      AlertNotification.fromMap(json.decode(source));

  @override
  String toString() {
    if (newStatus == 0) {
      return '$wagon. vagon $seatNo koltuğu artık boş.';
    }
    return '$wagon. vagon $seatNo koltuğu doldu.';
  }
}

class ScheduleWagon {
  final int wagon;
  final int? emptyCount;
  final int? totalCount;

  ScheduleWagon({
    required this.wagon,
    this.emptyCount,
    this.totalCount,
  });

  factory ScheduleWagon.fromMap(Map<String, dynamic> map) {
    return ScheduleWagon(
      wagon: map['wagon']?.toInt() ?? 0,
      emptyCount: map['emptyCount']?.toInt(),
      totalCount: map['totalCount']?.toInt(),
    );
  }

  factory ScheduleWagon.fromJson(String source) =>
      ScheduleWagon.fromMap(json.decode(source));
}
