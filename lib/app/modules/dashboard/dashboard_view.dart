// author/developer: Buwembo Allan
// page description: This page displays the dashboard with key performance indicators and quick actions.
// date: 2025-07-02

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/dashboard/dashboard_controller.dart';
import 'package:vent/theme/color_schemes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vent/app/app_pages.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: Get.textTheme.headlineSmall?.copyWith(color: primaryTextColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Key Performance Indicators',
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16.0),
              GridView.count(
                crossAxisCount: Get.width > 600 ? 4 : 2, // Responsive grid
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildKpiCard(
                    context,
                    title: 'Total Products',
                    value: controller.totalProducts.value.toString(),
                    subtitle: 'Current total items in inventory',
                    icon: FeatherIcons.box,
                    color: primaryColor,
                  ),
                  _buildKpiCard(
                    context,
                    title: 'Low Stock Products',
                    value: controller.lowStockCount.value.toString(),
                    subtitle: 'Items nearing depletion',
                    icon: FeatherIcons.alertTriangle,
                    color: accentColor,
                  ),
                  _buildKpiCard(
                    context,
                    title: 'Out of Stock Products',
                    value: controller.outOfStockCount.value.toString(),
                    subtitle: 'Products with zero stock',
                    icon: FeatherIcons.slash,
                    color: Colors.redAccent,
                  ),
                  _buildKpiCard(
                    context,
                    title: 'Total Suppliers',
                    value: controller.totalSuppliers.value.toString(),
                    subtitle: 'Linked active suppliers',
                    icon: FeatherIcons.users,
                    color: secondaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Text(
                'Stock Distribution',
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Card(
                    color: cardBackgroundColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                        () => PieChart(
                          PieChartData(
                            sections: controller.pieChartSections,
                            centerSpaceRadius: 40,
                            sectionsSpace: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Stock Levels by Category',
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200, // Fixed height for the bar chart
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Card(
                    color: cardBackgroundColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                        () => BarChart(
                          BarChartData(
                            barGroups: controller.barChartGroups,
                            borderData: FlBorderData(show: false),
                            gridData: const FlGridData(show: false),
                            titlesData: const FlTitlesData(show: false),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Stock Movement Over Time',
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200, // Fixed height for the line chart
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Card(
                    color: cardBackgroundColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                        () => LineChart(
                          LineChartData(
                            lineBarsData: [
                              LineChartBarData(
                                spots: controller.stockMovementSpots,
                                isCurved: true,
                                color: accentColor,
                                barWidth: 3,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(show: false),
                              ),
                            ],
                            borderData: FlBorderData(show: false),
                            gridData: const FlGridData(show: false),
                            titlesData: const FlTitlesData(show: false),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Top Low-Stock Items',
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 150, // Fixed height for the horizontal list
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.topLowStockItems.length,
                    itemBuilder: (context, index) {
                      final item = controller.topLowStockItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Card(
                            color: cardBackgroundColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              side: BorderSide(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Container(
                              width: 180,
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item['name'],
                                    style: Get.textTheme.titleMedium
                                        ?.copyWith(color: primaryTextColor),
                                  ),
                                  Text(
                                    'Qty: ${item['quantity']}',
                                    style: Get.textTheme.headlineSmall
                                        ?.copyWith(color: accentColor),
                                  ),
                                  Text(
                                    item['category'],
                                    style: Get.textTheme.bodySmall?.copyWith(
                                      color: secondaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Product Status',
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Card(
                    color: cardBackgroundColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                        () => PieChart(
                          PieChartData(
                            sections: controller.productStatusSections,
                            centerSpaceRadius: 60, // Donut chart effect
                            sectionsSpace: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Supplier Contribution',
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Card(
                    color: cardBackgroundColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                        () => PieChart(
                          PieChartData(
                            sections: controller.supplierContributionSections,
                            centerSpaceRadius: 40,
                            sectionsSpace: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Quick Actions',
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16.0),
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  _buildQuickActionButton(
                    context,
                    label: 'Add Product',
                    icon: FeatherIcons.plusCircle,
                    onPressed: () => Get.toNamed(Routes.ADD_EDIT_PRODUCT),
                  ),
                  _buildQuickActionButton(
                    context,
                    label: 'Low Stock',
                    icon: FeatherIcons.alertOctagon,
                    onPressed: () => Get.toNamed(Routes.LOW_STOCK_ALERTS),
                  ),
                  _buildQuickActionButton(
                    context,
                    label: 'Suppliers',
                    icon: FeatherIcons.users,
                    onPressed: () => Get.toNamed(Routes.SUPPLIERS),
                  ),
                  _buildQuickActionButton(
                    context,
                    label: 'Export CSV',
                    icon: FeatherIcons.download,
                    onPressed: () {
                      // Implement export functionality
                      Get.snackbar('Export', 'Exporting data to CSV...');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Text(
                'Recent Activities',
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Card(
                    color: cardBackgroundColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller.recentActivities.length,
                          itemBuilder: (context, index) {
                            final activity =
                                controller.recentActivities[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    activity.icon,
                                    color: accentColor,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          activity.title,
                                          style: Get.textTheme.titleMedium
                                              ?.copyWith(
                                                color: primaryTextColor,
                                              ),
                                        ),
                                        Text(
                                          activity.timestamp,
                                          style: Get.textTheme.bodySmall
                                              ?.copyWith(
                                                color: secondaryTextColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Alerts & Notifications',
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Card(
                    color: cardBackgroundColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                        () =>
                            controller.alerts.isEmpty
                                ? Center(
                                  child: Text(
                                    'No new alerts',
                                    style: Get.textTheme.bodyLarge?.copyWith(
                                      color: secondaryTextColor,
                                    ),
                                  ),
                                )
                                : ListView.builder(
                                  itemCount: controller.alerts.length,
                                  itemBuilder: (context, index) {
                                    final alert = controller.alerts[index];
                                    return Card(
                                      color:
                                          alert.type == 'warning'
                                              ? Colors.orange.withOpacity(0.2)
                                              : Colors.red.withOpacity(0.2),
                                      margin: const EdgeInsets.only(
                                        bottom: 8.0,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              alert.icon,
                                              color:
                                                  alert.type == 'warning'
                                                      ? Colors.orange
                                                      : Colors.red,
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    alert.message,
                                                    style: Get
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                          color:
                                                              primaryTextColor,
                                                        ),
                                                  ),
                                                  Text(
                                                    alert.timestamp,
                                                    style: Get
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color:
                                                              secondaryTextColor,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                FeatherIcons.xCircle,
                                                color: secondaryTextColor,
                                              ),
                                              onPressed:
                                                  () => controller
                                                      .dismissAlert(index),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKpiCard(
    BuildContext context, {
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Card(
        color: cardBackgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Get.textTheme.titleMedium?.copyWith(
                      color: primaryTextColor,
                    ),
                  ),
                  Icon(icon, color: color, size: 24),
                ],
              ),
              Obx(
                () => Text(
                  value,
                  style: Get.textTheme.displaySmall?.copyWith(
                    color: primaryTextColor,
                  ),
                ),
              ),
              Text(
                subtitle,
                style: Get.textTheme.bodySmall?.copyWith(
                  color: secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: primaryTextColor),
      label: Text(
        label,
        style: Get.textTheme.labelLarge?.copyWith(color: primaryTextColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
