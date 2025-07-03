import 'package:get/get.dart';
import 'package:vent/app/data/models/product_model.dart';
import 'package:vent/app/data/repositories/product_repository.dart';

class InventoryListController extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
  RxList<Product> products = <Product>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    isLoading.value = true;
    _productRepository.getProducts().listen((data) {
      products.assignAll(data);
      isLoading.value = false;
    });
  }

  void deleteProduct(String productId) async {
    await _productRepository.deleteProduct(productId);
  }

  void filterProducts(String query) {
    // Implement filtering logic here
  }

  void bulkAction(String action) {
    // Implement bulk actions here (e.g., delete selected, update selected)
  }
}