import 'package:get/get.dart';
import 'package:vent/app/data/models/supplier_model.dart';
// import 'package:vent/app/data/repositories/supplier_repository.dart';

class SuppliersController extends GetxController {
  // final SupplierRepository _supplierRepository = SupplierRepository();
  RxList<Supplier> suppliers = <Supplier>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSuppliers(); // Call mocked fetch
  }

  void fetchSuppliers() {
    isLoading.value = true;
    // Simulate fetching data with mock suppliers
    suppliers.assignAll([
      Supplier(
        id: 'S001',
        name: 'Mock Supplier A',
        contactPerson: 'John Doe',
        email: 'john.doe@example.com',
        phone: '123-456-7890',
        address: '123 Mock St, Mockville',
        isPreferred: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Supplier(
        id: 'S002',
        name: 'Mock Supplier B',
        contactPerson: 'Jane Smith',
        email: 'jane.smith@example.com',
        phone: '098-765-4321',
        address: '456 Fake Ave, Fakesburg',
        isPreferred: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ]);
    isLoading.value = false;
  }

  Future<void> addSupplier({
    required String name,
    required String contactPerson,
    required String email,
    required String phone,
    required String address,
    bool isPreferred = false,
  }) async {
    isLoading.value = true;
    try {
      // Mock add supplier
      Get.snackbar('Success', 'Supplier added successfully (UI-only)!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add supplier (UI-only): $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateSupplier(Supplier supplier) async {
    isLoading.value = true;
    try {
      // Mock update supplier
      Get.snackbar('Success', 'Supplier updated successfully (UI-only)!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update supplier (UI-only): $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteSupplier(String supplierId) async {
    isLoading.value = true;
    try {
      // Mock delete supplier
      Get.snackbar('Success', 'Supplier deleted successfully (UI-only)!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete supplier (UI-only): $e');
    } finally {
      isLoading.value = false;
    }
  }
}
