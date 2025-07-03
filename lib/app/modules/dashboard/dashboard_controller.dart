import 'package:get/get.dart';

class DashboardController extends GetxController {
  var totalStockLevels = 0.obs;
  var lowStockCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  void fetchDashboardData() {
    // Simulate fetching data
    totalStockLevels.value = 1250;
    lowStockCount.value = 15;
  }
}