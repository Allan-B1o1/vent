import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/dashboard/dashboard_controller.dart';
import 'package:vent/theme/color_schemes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vent/app/app_pages.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Key Performance Indicators', style: Get.textTheme.headlineSmall),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Stock Levels', style: Get.textTheme.titleMedium),
                          Obx(() => Text(
                            controller.totalStockLevels.value.toString(),
                            style: Get.textTheme.displaySmall?.copyWith(color: primaryColor),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Low Stock Count', style: Get.textTheme.titleMedium),
                          Obx(() => Text(
                            controller.lowStockCount.value.toString(),
                            style: Get.textTheme.displaySmall?.copyWith(color: accentColor),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            Text('Quick Actions', style: Get.textTheme.headlineSmall),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to Add/Edit Product
                    Get.toNamed(AppPages.INITIAL); // Assuming INITIAL is ADD_EDIT_PRODUCT or similar
                  },
                  icon: const Icon(FeatherIcons.plusCircle),
                  label: const Text('Add New Product'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to Inventory List
                    Get.toNamed(AppPages.routes[2].name!); // Assuming INVENTORY_LIST is the 3rd route
                  },
                  icon: const Icon(FeatherIcons.package),
                  label: const Text('View Inventory'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to Low Stock Alerts
                    Get.toNamed(AppPages.routes[6].name!); // Assuming LOW_STOCK_ALERTS is the 7th route
                  },
                  icon: const Icon(FeatherIcons.alertTriangle),
                  label: const Text('Check Low Stock'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
