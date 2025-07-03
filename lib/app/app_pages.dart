import 'package:get/get.dart';
import 'package:vent/app/modules/add_edit_product/add_edit_product_binding.dart';
import 'package:vent/app/modules/add_edit_product/add_edit_product_view.dart';
import 'package:vent/app/modules/dashboard/dashboard_binding.dart';
import 'package:vent/app/modules/dashboard/dashboard_view.dart';
import 'package:vent/app/modules/inventory_list/inventory_list_binding.dart';
import 'package:vent/app/modules/inventory_list/inventory_list_view.dart';
import 'package:vent/app/modules/low_stock_alerts/low_stock_alerts_binding.dart';
import 'package:vent/app/modules/low_stock_alerts/low_stock_alerts_view.dart';
import 'package:vent/app/modules/stock_details/stock_details_binding.dart';
import 'package:vent/app/modules/stock_details/stock_details_view.dart';
import 'package:vent/app/modules/suppliers/suppliers_binding.dart';
import 'package:vent/app/modules/suppliers/suppliers_view.dart';
import 'package:vent/app/modules/home/home_view.dart';
import 'package:vent/app/modules/home/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.INVENTORY_LIST,
      page: () => const InventoryListView(),
      binding: InventoryListBinding(),
    ),
    GetPage(
      name: Routes.STOCK_DETAILS,
      page: () => const StockDetailsView(),
      binding: StockDetailsBinding(),
    ),
    GetPage(
      name: Routes.ADD_EDIT_PRODUCT,
      page: () => const AddEditProductView(),
      binding: AddEditProductBinding(),
    ),
    GetPage(
      name: Routes.SUPPLIERS,
      page: () => const SuppliersView(),
      binding: SuppliersBinding(),
    ),
    GetPage(
      name: Routes.LOW_STOCK_ALERTS,
      page: () => const LowStockAlertsView(),
      binding: LowStockAlertsBinding(),
    ),
  ];
}
