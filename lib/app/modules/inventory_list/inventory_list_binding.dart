import 'package:get/get.dart';
import 'package:vent/app/modules/inventory_list/inventory_list_controller.dart';

class InventoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryListController>(
      () => InventoryListController(),
    );
  }
}
