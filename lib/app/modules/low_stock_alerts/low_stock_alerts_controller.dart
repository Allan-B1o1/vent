import 'package:get/get.dart';
import 'package:vent/app/data/models/product_model.dart';
// import 'package:vent/app/data/repositories/product_repository.dart';

class LowStockAlertsController extends GetxController {
  // final ProductRepository _productRepository = ProductRepository();
  RxList<Product> lowStockProducts = <Product>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLowStockProducts(); // Call mocked fetch
  }

  void fetchLowStockProducts() {
    isLoading.value = true;
    // Simulate fetching data with mock low stock products
    lowStockProducts.assignAll([
      Product(
        id: '3',
        name: 'Mock Product 3 (Low Stock)',
        description: 'This product is running low.',
        category: 'Food',
        price: 5.99,
        stockQuantity: 5,
        imageUrl: 'https://via.placeholder.com/150',
        supplierId: 'SUP003',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Product(
        id: '4',
        name: 'Mock Product 4 (Low Stock)',
        description: 'Another low stock item.',
        category: 'Office Supplies',
        price: 12.00,
        stockQuantity: 8,
        imageUrl: 'https://via.placeholder.com/150',
        supplierId: 'SUP004',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ]);
    isLoading.value = false;
  }
}
