import 'package:get/get.dart';
import 'package:vent/app/data/models/supplier_model.dart';
import 'package:vent/app/data/repositories/supplier_repository.dart';

class SuppliersController extends GetxController {
  final SupplierRepository _supplierRepository = SupplierRepository();
  RxList<Supplier> suppliers = <Supplier>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSuppliers();
  }

  void fetchSuppliers() {
    isLoading.value = true;
    _supplierRepository.getSuppliers().listen((data) {
      suppliers.assignAll(data);
      isLoading.value = false;
    });
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
      Supplier newSupplier = Supplier(
        name: name,
        contactPerson: contactPerson,
        email: email,
        phone: phone,
        address: address,
        isPreferred: isPreferred,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await _supplierRepository.addSupplier(newSupplier);
      Get.snackbar('Success', 'Supplier added successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add supplier: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateSupplier(Supplier supplier) async {
    isLoading.value = true;
    try {
      await _supplierRepository.updateSupplier(supplier);
      Get.snackbar('Success', 'Supplier updated successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update supplier: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteSupplier(String supplierId) async {
    isLoading.value = true;
    try {
      await _supplierRepository.deleteSupplier(supplierId);
      Get.snackbar('Success', 'Supplier deleted successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete supplier: $e');
    } finally {
      isLoading.value = false;
    }
  }
}