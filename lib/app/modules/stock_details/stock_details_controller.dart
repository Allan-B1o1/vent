import 'package:get/get.dart';
import 'package:vent/app/data/models/product_model.dart';

class StockDetailsController extends GetxController {
  Rx<Product?> product = Rx<Product?>(null);

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Product) {
      product.value = Get.arguments as Product;
    }
  }

  // You can add methods here to fetch stock history or other related data
}