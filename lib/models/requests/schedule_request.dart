class ScheduleRequest {
  final String departure;
  final String destination;
  final DateTime departureDate;

  ScheduleRequest({
    required this.departure,
    required this.destination,
    required this.departureDate,
  });
}
