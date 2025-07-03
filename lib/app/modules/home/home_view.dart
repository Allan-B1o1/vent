import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/home/home_controller.dart';
import 'package:vent/app/modules/dashboard/dashboard_view.dart';
import 'package:vent/app/modules/inventory_list/inventory_list_view.dart';
import 'package:vent/app/modules/stock_details/stock_details_view.dart';
import 'package:vent/app/modules/add_edit_product/add_edit_product_view.dart';
import 'package:vent/app/modules/suppliers/suppliers_view.dart';
import 'package:vent/app/modules/low_stock_alerts/low_stock_alerts_view.dart';
import 'package:vent/theme/color_schemes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Obx(
            () => NavigationRail(
              backgroundColor: backgroundColor,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) {
                controller.changePage(index);
              },
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.home, color: primaryTextColor),
                  selectedIcon: Icon(FeatherIcons.home, color: accentColor),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.package, color: primaryTextColor),
                  selectedIcon: Icon(FeatherIcons.package, color: accentColor),
                  label: Text('Inventory List'),
                ),
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.fileText, color: primaryTextColor),
                  selectedIcon: Icon(FeatherIcons.fileText, color: accentColor),
                  label: Text('Stock Details'),
                ),
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.plusCircle, color: primaryTextColor),
                  selectedIcon: Icon(FeatherIcons.plusCircle, color: accentColor),
                  label: Text('Add/Edit Product'),
                ),
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.truck, color: primaryTextColor),
                  selectedIcon: Icon(FeatherIcons.truck, color: accentColor),
                  label: Text('Suppliers'),
                ),
                NavigationRailDestination(
                  icon: Icon(FeatherIcons.alertTriangle, color: primaryTextColor),
                  selectedIcon: Icon(FeatherIcons.alertTriangle, color: accentColor),
                  label: Text('Low Stock Alerts'),
                ),
              ],
            ),
          ),
          Expanded(
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
        ],
      ),
    );
  }
}
