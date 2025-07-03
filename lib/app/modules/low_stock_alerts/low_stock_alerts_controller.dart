import 'package:get/get.dart';
import 'package:vent/app/data/models/product_model.dart';
import 'package:vent/app/data/repositories/product_repository.dart';

class LowStockAlertsController extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
  RxList<Product> lowStockProducts = <Product>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLowStockProducts();
  }

  void fetchLowStockProducts() {
    isLoading.value = true;
    _productRepository.getProducts().listen((products) {
      lowStockProducts.assignAll(products.where((p) => p.stockQuantity < 10).toList()); // Assuming low stock threshold is 10
      isLoading.value = false;
    });
  }
}