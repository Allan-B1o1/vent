import 'package:get/get.dart';
import 'package:vent/app/modules/stock_details/stock_details_controller.dart';

class StockDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockDetailsController>(
      () => StockDetailsController(),
    );
  }
}
