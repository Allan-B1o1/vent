import 'package:get/get.dart';
import 'package:vent/app/data/models/product_model.dart';
// import 'package:vent/app/data/repositories/product_repository.dart';

class InventoryListController extends GetxController {
  // final ProductRepository _productRepository = ProductRepository();
  RxList<Product> products = <Product>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts(); // Call mocked fetch
  }

  void fetchProducts() {
    isLoading.value = true;
    // Simulate fetching data with mock products
    products.assignAll([
      Product(
        id: '1',
        name: 'Ceramic Mug',
        description: 'High-quality ceramic mug, perfect for coffee or tea.',
        category: 'Kitchenware',
        price: 12.99,
        stockQuantity: 200,
        imageUrl: 'https://images.unsplash.com/photo-1650959858546-d09833d5317b?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmxhbmslMjBtdWd8ZW58MHx8MHx8fDA%3D',
        supplierId: 'SUP001',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Product(
        id: '2',
        name: 'Running Sneakers',
        description: 'Comfortable and durable running shoes for all terrains.',
        category: 'Footwear',
        price: 89.99,
        stockQuantity: 75,
        imageUrl: 'https://images.unsplash.com/photo-1724921195452-6a54a4ef8a43?q=80&w=1033&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        supplierId: 'SUP002',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Product(
        id: '3',
        name: 'Cotton T-Shirt',
        description: 'Soft and breathable 100% cotton t-shirt.',
        category: 'Apparel',
        price: 19.99,
        stockQuantity: 300,
        imageUrl: 'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?q=80&w=415&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        supplierId: 'SUP003',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Product(
        id: '4',
        name: 'Laptop Pro 15',
        description: 'Powerful laptop with 15-inch display and 16GB RAM.',
        category: 'Electronics',
        price: 1200.00,
        stockQuantity: 30,
        imageUrl: 'https://plus.unsplash.com/premium_photo-1681302427948-2fd0eca629b1?q=80&w=435&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        supplierId: 'SUP004',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Product(
        id: '5',
        name: 'Fantasy Novel',
        description: 'An epic fantasy adventure, first in a new series.',
        category: 'Books',
        price: 15.00,
        stockQuantity: 120,
        imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        supplierId: 'SUP005',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ]);
    isLoading.value = false;
  }

  void deleteProduct(String productId) async {
    // await _productRepository.deleteProduct(productId); // Commented out backend call
    Get.snackbar('Info', 'Delete product is disabled in UI-only mode.');
  }

  void filterProducts(String query) {
    // Implement filtering logic here (UI-only)
    Get.snackbar('Info', 'Filtering is disabled in UI-only mode.');
  }

  void bulkAction(String action) {
    // Implement bulk actions here (UI-only)
    Get.snackbar('Info', 'Bulk actions are disabled in UI-only mode.');
  }
}
