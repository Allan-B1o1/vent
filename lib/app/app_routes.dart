part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const INVENTORY_LIST = _Paths.INVENTORY_LIST;
  static const STOCK_DETAILS = _Paths.STOCK_DETAILS;
  static const ADD_EDIT_PRODUCT = _Paths.ADD_EDIT_PRODUCT;
  static const SUPPLIERS = _Paths.SUPPLIERS;
  static const LOW_STOCK_ALERTS = _Paths.LOW_STOCK_ALERTS;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const DASHBOARD = '/dashboard';
  static const INVENTORY_LIST = '/inventory-list';
  static const STOCK_DETAILS = '/stock-details';
  static const ADD_EDIT_PRODUCT = '/add-edit-product';
  static const SUPPLIERS = '/suppliers';
  static const LOW_STOCK_ALERTS = '/low-stock-alerts';
}