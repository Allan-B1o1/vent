// author/developer: Buwembo Allan
// page description: This page displays the details of a specific product.
// date: 2025-07-06

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/stock_details/stock_details_controller.dart';
import 'package:vent/theme/color_schemes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';

class StockDetailsView extends GetView<StockDetailsController> {
  const StockDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.product.value == null) {
          return const Center(child: Text('Product not found.'));
        }
        final product = controller.product.value!;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: product.imageUrl.isNotEmpty
                    ? Image.network(
                        product.imageUrl,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : const Icon(FeatherIcons.image, size: 150, color: secondaryTextColor),
              ),
              const SizedBox(height: 16.0),
              Text(product.name, style: Get.textTheme.headlineMedium),
              const SizedBox(height: 8.0),
              Text(product.description, style: Get.textTheme.bodyLarge),
              const SizedBox(height: 16.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Category', product.category),
                      _buildDetailRow('Price', '\$${product.price.toStringAsFixed(2)}'),
                      _buildDetailRow('Stock Quantity', product.stockQuantity.toString()),
                      _buildDetailRow('Supplier ID', product.supplierId),
                      _buildDetailRow('Created At', DateFormat('yyyy-MM-dd HH:mm').format(product.createdAt)),
                      _buildDetailRow('Updated At', DateFormat('yyyy-MM-dd HH:mm').format(product.updatedAt)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text('Stock History Timeline (Placeholder)', style: Get.textTheme.headlineSmall),
              // TODO: Implement stock history timeline
            ],
          ),
        );
      }),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Get.textTheme.titleSmall?.copyWith(color: secondaryTextColor)),
          Text(value, style: Get.textTheme.titleSmall),
        ],
      ),
    );
  }
}
