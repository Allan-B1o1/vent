import 'package:get/get.dart';
import 'package:vent/app/data/models/product_model.dart';
// import 'package:vent/app/data/repositories/product_repository.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';

class AddEditProductController extends GetxController {
  // final ProductRepository _productRepository = ProductRepository();
  // final ImagePicker _picker = ImagePicker();
  // final FirebaseStorage _storage = FirebaseStorage.instance;

  Rx<Product?> productToEdit = Rx<Product?>(null);
  RxString imageUrl = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Product) {
      productToEdit.value = Get.arguments as Product;
      imageUrl.value = productToEdit.value!.imageUrl;
    }
  }

  Future<void> pickImage() async {
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // if (image != null) {
    //   isLoading.value = true;
    //   try {
    //     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    //     Reference storageRef = _storage.ref().child('product_images/$fileName');
    //     UploadTask uploadTask = storageRef.putFile(File(image.path));
    //     TaskSnapshot snapshot = await uploadTask;
    //     imageUrl.value = await snapshot.ref.getDownloadURL();
    //   } catch (e) {
    //     Get.snackbar('Error', 'Failed to upload image: $e');
    //   } finally {
    //     isLoading.value = false;
    //   }
    // }
    Get.snackbar('Info', 'Image picking is disabled in UI-only mode.');
  }

  Future<void> saveProduct({
    required String name,
    required String description,
    required String category,
    required double price,
    required int stockQuantity,
    required String supplierId,
  }) async {
    isLoading.value = true;
    try {
      if (productToEdit.value == null) {
        // Add new product (mock)
        Get.snackbar('Success', 'Product added successfully (UI-only)!');
      } else {
        // Update existing product (mock)
        Get.snackbar('Success', 'Product updated successfully (UI-only)!');
      }
      Get.back(); // Go back to previous screen (e.g., Inventory List)
    } catch (e) {
      Get.snackbar('Error', 'Failed to save product (UI-only): $e');
    } finally {
      isLoading.value = false;
    }
  }
}
