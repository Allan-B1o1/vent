import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/add_edit_product/add_edit_product_controller.dart';
import 'package:vent/theme/color_schemes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class AddEditProductView extends GetView<AddEditProductController> {
  const AddEditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditing = controller.productToEdit.value != null;
    final TextEditingController nameController = TextEditingController(text: isEditing ? controller.productToEdit.value!.name : '');
    final TextEditingController descriptionController = TextEditingController(text: isEditing ? controller.productToEdit.value!.description : '');
    final TextEditingController categoryController = TextEditingController(text: isEditing ? controller.productToEdit.value!.category : '');
    final TextEditingController priceController = TextEditingController(text: isEditing ? controller.productToEdit.value!.price.toString() : '');
    final TextEditingController stockQuantityController = TextEditingController(text: isEditing ? controller.productToEdit.value!.stockQuantity.toString() : '');
    final TextEditingController supplierIdController = TextEditingController(text: isEditing ? controller.productToEdit.value!.supplierId : '');

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Product' : 'Add Product'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Obx(() => controller.imageUrl.value.isNotEmpty
                          ? Image.network(
                              controller.imageUrl.value,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          : const Icon(FeatherIcons.image, size: 100, color: secondaryTextColor)),
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: controller.pickImage,
                        icon: const Icon(FeatherIcons.upload),
                        label: const Text('Upload Image'),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Product Name',
                        hintText: 'Enter product name',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter product description',
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: categoryController,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        hintText: 'Enter product category',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: priceController,
                      decoration: const InputDecoration(
                        labelText: 'Price',
                        hintText: 'Enter product price',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: stockQuantityController,
                      decoration: const InputDecoration(
                        labelText: 'Stock Quantity',
                        hintText: 'Enter stock quantity',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: supplierIdController,
                      decoration: const InputDecoration(
                        labelText: 'Supplier ID',
                        hintText: 'Enter supplier ID',
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.saveProduct(
                            name: nameController.text,
                            description: descriptionController.text,
                            category: categoryController.text,
                            price: double.tryParse(priceController.text) ?? 0.0,
                            stockQuantity: int.tryParse(stockQuantityController.text) ?? 0,
                            supplierId: supplierIdController.text,
                          );
                        },
                        child: Text(isEditing ? 'Update Product' : 'Add Product'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}