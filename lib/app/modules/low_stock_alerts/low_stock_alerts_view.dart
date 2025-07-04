// author/developer: Buwembo Allan
// page description: This page displays alerts for products with low stock.
// date: 2025-07-05

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/low_stock_alerts/low_stock_alerts_controller.dart';
import 'package:vent/theme/color_schemes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vent/app/app_pages.dart';

class LowStockAlertsView extends GetView<LowStockAlertsController> {
  const LowStockAlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Low Stock Alerts'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.lowStockProducts.isEmpty
                ? const Center(child: Text('No low stock alerts at the moment.'))
                : ListView.builder(
                    itemCount: controller.lowStockProducts.length,
                    itemBuilder: (context, index) {
                      final product = controller.lowStockProducts[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: ListTile(
                          leading: product.imageUrl.isNotEmpty
                              ? Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                              : const Icon(FeatherIcons.image, size: 50, color: secondaryTextColor),
                          title: Text(product.name, style: Get.textTheme.titleMedium),
                          subtitle: Text(
                            'Current Stock: ${product.stockQuantity} | Category: ${product.category}',
                            style: Get.textTheme.bodySmall,
                          ),
                          trailing: IconButton(
                            icon: const Icon(FeatherIcons.eye, color: primaryColor),
                            onPressed: () {
                              Get.toNamed(Routes.STOCK_DETAILS, arguments: product);
                            },
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
