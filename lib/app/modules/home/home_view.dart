// author/developer: Buwembo Allan
// page description: This is the home page that contains the navigation rail and displays the different views.
// date: 2025-07-03

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/home/home_controller.dart';
import 'package:vent/app/modules/dashboard/dashboard_view.dart';
import 'package:vent/app/modules/inventory_list/inventory_list_view.dart';
import 'package:vent/app/modules/stock_details/stock_details_view.dart';
import 'package:vent/app/modules/add_edit_product/add_edit_product_view.dart';
import 'package:vent/app/modules/suppliers/suppliers_view.dart';
import 'package:vent/app/modules/low_stock_alerts/low_stock_alerts_view.dart';
// import 'package:vent/theme/color_schemes.dart'; // color_schemes.dart is implicitly used via Theme
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access theme data

    return Scaffold(
      // Scaffold background will be set by the global theme
      body: Row(
        children: [
          Obx(
            () => NavigationRail(
              // backgroundColor is handled by navigationRailTheme in main.dart
              // To make it fully transparent if needed: backgroundColor: Colors.transparent,
              // Or ensure navigationRailTheme.backgroundColor is set to theme.colorScheme.surface or Colors.transparent
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) {
                controller.changePage(index);
              },
              labelType: NavigationRailLabelType.all, // Shows labels for all items
              // selectedIconTheme and unselectedIconTheme are set in main.dart's navigationRailTheme
              // selectedLabelTextStyle and unselectedLabelTextStyle are set in main.dart's navigationRailTheme
              destinations: [
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.home), // Color will be picked from unselectedIconTheme
                  selectedIcon: Icon(FeatherIcons.home), // Color will be picked from selectedIconTheme
                  label: Text('Dashboard', style: theme.textTheme.labelSmall), // Style from theme
                ),
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.package),
                  selectedIcon: Icon(FeatherIcons.package),
                  label: Text('Inventory', style: theme.textTheme.labelSmall),
                ),
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.fileText),
                  selectedIcon: Icon(FeatherIcons.fileText),
                  label: Text('Details', style: theme.textTheme.labelSmall),
                ),
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.plusCircle),
                  selectedIcon: Icon(FeatherIcons.plusCircle),
                  label: Text('Add/Edit', style: theme.textTheme.labelSmall),
                ),
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.truck),
                  selectedIcon: Icon(FeatherIcons.truck),
                  label: Text('Suppliers', style: theme.textTheme.labelSmall),
                ),
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.alertTriangle),
                  selectedIcon: Icon(FeatherIcons.alertTriangle),
                  label: Text('Alerts', style: theme.textTheme.labelSmall),
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1), // Optional: visual separation
          Expanded(
            child: Container( // Ensure this container uses the theme's background
              color: theme.colorScheme.background, // Explicitly set background for content area
              child: Obx(
                () => IndexedStack(
                  index: controller.selectedIndex.value,
                  children: const [
                    DashboardView(),
                    InventoryListView(),
                    StockDetailsView(),
                    AddEditProductView(),
                    SuppliersView(),
                    LowStockAlertsView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
