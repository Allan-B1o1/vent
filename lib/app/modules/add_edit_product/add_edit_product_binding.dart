import 'package:get/get.dart';
import 'package:vent/app/modules/add_edit_product/add_edit_product_controller.dart';

class AddEditProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditProductController>(
      () => AddEditProductController(),
    );
  }
}
