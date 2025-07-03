import 'package:get/get.dart';
import 'package:vent/app/modules/suppliers/suppliers_controller.dart';

class SuppliersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuppliersController>(
      () => SuppliersController(),
    );
  }
}
