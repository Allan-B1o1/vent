import 'package:get/get.dart';
import 'package:vent/app/modules/low_stock_alerts/low_stock_alerts_controller.dart';

class LowStockAlertsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LowStockAlertsController>(
      () => LowStockAlertsController(),
    );
  }
}
