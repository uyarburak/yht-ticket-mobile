import 'package:get/get.dart';
import 'package:yht_ticket/api/api.dart';
import 'package:yht_ticket/models/models.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/common_widget.dart';
import 'package:yht_ticket/shared/utils/focus.dart';

class SchedulesController extends GetxController {
  final BaseApiRepository apiRepository;
  late RxString departure;
  late RxString destination;
  SchedulesController({required this.apiRepository}) {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    days.value =
        List.generate(5, (index) => today.add(Duration(days: index))).toList();

    selectedDate = today.obs;
    departure = Get.parameters['departure']!.obs;
    destination = Get.parameters['destination']!.obs;
  }

  var selectedDateIndex = 0.obs;

  var error = false.obs;
  var loading = true.obs;
  var schedules = RxList<ScheduleResponse>();
  List<ScheduleResponse> get selectedSchedules =>
      schedules.where((s) => s.selected).toList();

  var days = RxList<DateTime>();
  late Rx<DateTime> selectedDate;

  @override
  void onInit() {
    getSchedules();
    super.onInit();
  }

  setSelectedDate(DateTime date) {
    selectedDate.value = date;
    getSchedules();
  }

  swapStations() {
    var tmp = destination.value;
    destination.value = departure.value;
    departure.value = tmp;
    getSchedules();
  }

  createAlerts() async {
    List<CreateAlertRequest> alerts = [];
    for (var schedule in selectedSchedules) {
      var wagons = schedule.wagonTypes
          .where((element) => element.selected)
          .mapMany((item) => item.wagons)
          .toList();
      wagons.sort();
      alerts.add(CreateAlertRequest(
        scheduleId: schedule.id,
        departureStationName: departure.value,
        destinationStationName: destination.value,
        startDate: schedule.startDate,
        endDate: schedule.endDate,
        wagons: wagons,
      ));
    }
    var request = CreateAlertsRequest(alerts: alerts);

    final list = await apiRepository.createAlerts(request);
    if (list != null) {
      CommonWidget.toast('${list.length} alarm oluşturuldu');
      Get.offAndToNamed(Routes.DASHBOARD);
    }
  }

  void getSchedules() async {
    loading.value = true;
    try {
      AppFocus.unfocus(Get.context!);
      final list = await apiRepository.getSchedules(
        ScheduleRequest(
          departure: departure.value,
          destination: destination.value,
          departureDate: selectedDate.value,
        ),
      );

      if (list == null) {
        error.value = true;
        return;
      }

      schedules.value = list;
    } on Exception catch (_) {
      //
      error.value = true;
    } finally {
      loading.value = false;
    }
  }
}
