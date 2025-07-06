// author/developer: Buwembo Allan
// page description: This page displays the dashboard with key performance indicators and quick actions.
// date: 2025-07-02

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/dashboard/dashboard_controller.dart';
// import 'package:vent/theme/color_schemes.dart'; // Theme colors are accessed via Theme.of(context)
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vent/app/app_pages.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      // extendBodyBehindAppBar: true, // Can cause UI issues if not handled carefully with padding
      appBar: AppBar(
        // backgroundColor, titleTextStyle, etc., are handled by appBarTheme in main.dart
        title: Text('Dashboard', style: textTheme.headlineSmall),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Added SingleChildScrollView for scrollability
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Key Performance Indicators',
                style: textTheme.headlineSmall,
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
                    iconColor: theme.colorScheme.primary, // Use theme colors
                  ),
                  _buildKpiCard(
                    context,
                    title: 'Low Stock Products',
                    value: controller.lowStockCount.value.toString(),
                    subtitle: 'Items nearing depletion',
                    icon: FeatherIcons.alertTriangle,
                    iconColor: theme.colorScheme.secondary, // Use theme colors
                  ),
                  _buildKpiCard(
                    context,
                    title: 'Out of Stock Products',
                    value: controller.outOfStockCount.value.toString(),
                    subtitle: 'Products with zero stock',
                    icon: FeatherIcons.slash,
                    iconColor: theme.colorScheme.error, // Use theme colors
                  ),
                  _buildKpiCard(
                    context,
                    title: 'Total Suppliers',
                    value: controller.totalSuppliers.value.toString(),
                    subtitle: 'Linked active suppliers',
                    icon: FeatherIcons.users,
                    iconColor: theme.colorScheme.tertiary, // Example, define if needed or use primary/secondary
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Text(
                'Stock Distribution',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              SizedBox( // Explicitly size chart containers
                height: 250,
                child: Card( // Card styling from theme.cardTheme
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(
                      () => PieChart(
                        PieChartData(
                          sections: controller.pieChartSections, // Ensure these sections use theme colors
                          centerSpaceRadius: 40,
                          sectionsSpace: 2,
                          pieTouchData: PieTouchData(
                            touchCallback: (FlTouchEvent event, pieTouchResponse) {
                              // Handle touch events if necessary
                            },
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
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(
                      () => BarChart(
                        BarChartData(
                          barGroups: controller.barChartGroups, // Ensure these groups use theme colors
                          borderData: FlBorderData(show: false),
                          gridData: const FlGridData(show: false),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) => SideTitleWidget(axisSide: meta.axisSide, child: Text(meta.formattedValue, style: textTheme.bodySmall)))),
                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) => SideTitleWidget(axisSide: meta.axisSide, child: Text(meta.formattedValue, style: textTheme.bodySmall)))),
                            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Stock Movement Over Time',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(
                      () => LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: controller.stockMovementSpots,
                              isCurved: true,
                              color: theme.colorScheme.secondary, // Use theme color
                              barWidth: 3,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                          borderData: FlBorderData(show: false),
                          gridData: const FlGridData(show: false),
                           titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) => SideTitleWidget(axisSide: meta.axisSide, child: Text(meta.formattedValue, style: textTheme.bodySmall)))),
                            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) => SideTitleWidget(axisSide: meta.axisSide, child: Text(meta.formattedValue, style: textTheme.bodySmall)))),
                            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Top Low-Stock Items',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 150,
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.topLowStockItems.length,
                    itemBuilder: (context, index) {
                      final item = controller.topLowStockItems[index];
                      return SizedBox( // Give fixed width to horizontal list items
                        width: 200,
                        child: Card( // Card styling from theme
                          margin: const EdgeInsets.only(right: 16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['name'],
                                  style: textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Qty: ${item['quantity']}',
                                  style: textTheme.headlineSmall?.copyWith(color: theme.colorScheme.secondary),
                                ),
                                Text(
                                  item['category'],
                                  style: textTheme.bodySmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
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
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
               SizedBox(
                height: 250,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(
                      () => PieChart(
                        PieChartData(
                          sections: controller.productStatusSections, // Ensure theme colors
                          centerSpaceRadius: 60, // Donut chart effect
                          sectionsSpace: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Supplier Contribution',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 250,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(
                      () => PieChart(
                        PieChartData(
                          sections: controller.supplierContributionSections, // Ensure theme colors
                          centerSpaceRadius: 40,
                          sectionsSpace: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Quick Actions',
                style: textTheme.headlineSmall,
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
                      Get.snackbar(
                        'Export',
                        'Exporting data to CSV...',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: theme.colorScheme.surface,
                        colorText: theme.colorScheme.onSurface,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Text(
                'Recent Activities',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              Card( // Wrap ListView in a Card for consistent styling
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding inside card
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true, // Important for ListView inside Column/SingleChildScrollView
                      physics: const NeverScrollableScrollPhysics(), // If inside SingleChildScrollView
                      itemCount: controller.recentActivities.length,
                      itemBuilder: (context, index) {
                        final activity = controller.recentActivities[index];
                        return ListTile( // Use ListTile for better structure
                          leading: Icon(activity.icon, color: theme.colorScheme.secondary, size: 24),
                          title: Text(activity.title, style: textTheme.titleMedium),
                          subtitle: Text(activity.timestamp, style: textTheme.bodySmall),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Alerts & Notifications',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              Obx(
                () => controller.alerts.isEmpty
                    ? Card( // Wrap "No new alerts" in a Card too
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'No new alerts',
                              style: textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7)),
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.alerts.length,
                        itemBuilder: (context, index) {
                          final alert = controller.alerts[index];
                          return Card(
                            color: alert.type == 'warning'
                                ? theme.colorScheme.secondary.withOpacity(0.2) // Use theme colors
                                : theme.colorScheme.error.withOpacity(0.2),    // Use theme colors
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              leading: Icon(
                                alert.icon,
                                color: alert.type == 'warning'
                                    ? theme.colorScheme.secondary
                                    : theme.colorScheme.error,
                              ),
                              title: Text(alert.message, style: textTheme.titleMedium),
                              subtitle: Text(alert.timestamp, style: textTheme.bodySmall),
                              trailing: IconButton(
                                icon: Icon(FeatherIcons.xCircle, color: theme.colorScheme.onSurface.withOpacity(0.7)),
                                onPressed: () => controller.dismissAlert(index),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 32.0), // Add some padding at the end
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
    required Color iconColor, // Changed from 'color' to 'iconColor' for clarity
  }) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card( // Card styling will come from theme.cardTheme
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded( // Allow title to wrap if too long
                  child: Text(
                    title,
                    style: textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(icon, color: iconColor, size: 24),
              ],
            ),
            Obx( // Assuming 'value' might be observable, otherwise Text(value) is fine
              () => Text(
                value,
                style: textTheme.displaySmall,
              ),
            ),
            Text(
              subtitle,
              style: textTheme.bodySmall,
              maxLines: 2, // Allow subtitle to take up to 2 lines
              overflow: TextOverflow.ellipsis,
            ),
          ],
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
    final theme = Theme.of(context);
    // ElevatedButton styling will come from theme.elevatedButtonTheme
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon), // Icon color will be handled by the theme's foregroundColor
      label: Text(label), // Text style will be handled by the theme
      // No need to specify style here if it's well-defined in main.dart's theme
    );
  }
}
