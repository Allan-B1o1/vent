import 'package:get/get.dart';
import 'package:vent/app/modules/home/home_controller.dart';
import 'package:vent/app/modules/dashboard/dashboard_controller.dart';
import 'package:vent/app/modules/inventory_list/inventory_list_controller.dart';
import 'package:vent/app/modules/stock_details/stock_details_controller.dart';
import 'package:vent/app/modules/add_edit_product/add_edit_product_controller.dart';
import 'package:vent/app/modules/suppliers/suppliers_controller.dart';
import 'package:vent/app/modules/low_stock_alerts/low_stock_alerts_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<InventoryListController>(
      () => InventoryListController(),
    );
    Get.lazyPut<StockDetailsController>(
      () => StockDetailsController(),
    );
    Get.lazyPut<AddEditProductController>(
      () => AddEditProductController(),
    );
    Get.lazyPut<SuppliersController>(
      () => SuppliersController(),
    );
    Get.lazyPut<LowStockAlertsController>(
      () => LowStockAlertsController(),
    );
  }
}
