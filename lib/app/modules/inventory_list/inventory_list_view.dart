// author/developer: Buwembo Allan
// page description: This page displays the list of inventory products.
// date: 2025-07-04

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/inventory_list/inventory_list_controller.dart';
import 'package:vent/theme/color_schemes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vent/app/app_pages.dart';

class InventoryListView extends GetView<InventoryListController> {
  const InventoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.plusCircle),
            onPressed: () {
              Get.toNamed(Routes.ADD_EDIT_PRODUCT);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(FeatherIcons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[900],
              ),
              onChanged: (value) {
                // controller.filterProducts(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        final product = controller.products[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: ListTile(
                            leading: product.imageUrl.isNotEmpty
                                ? Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                                : const Icon(FeatherIcons.image, size: 50, color: secondaryTextColor),
                            title: Text(product.name, style: Get.textTheme.titleMedium),
                            subtitle: Text('Stock: ${product.stockQuantity} | Price: \$${product.price.toStringAsFixed(2)}', style: Get.textTheme.bodySmall),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(FeatherIcons.edit, color: primaryColor),
                                  onPressed: () {
                                    // Navigate to edit product page
                                    Get.toNamed(Routes.ADD_EDIT_PRODUCT, arguments: product);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(FeatherIcons.trash2, color: accentColor),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Delete Product",
                                      middleText: "Are you sure you want to delete ${product.name}?",
                                      textConfirm: "Delete",
                                      textCancel: "Cancel",
                                      confirmTextColor: primaryTextColor,
                                      buttonColor: accentColor,
                                      onConfirm: () {
                                        // controller.deleteProduct(product.id!);
                                        Get.back();
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            onTap: () {
                              Get.toNamed(Routes.STOCK_DETAILS, arguments: product);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ),
          // Placeholder for bulk actions
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // controller.bulkAction('some_action');
              },
              child: const Text('Perform Bulk Action (Placeholder)'),
            ),
          ),
        ],
      ),
    );
  }
}
