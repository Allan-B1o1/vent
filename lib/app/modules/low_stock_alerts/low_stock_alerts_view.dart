// author/developer: Buwembo Allan
// page description: This page displays alerts for products with low stock.
// date: 2025-07-05

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/low_stock_alerts/low_stock_alerts_controller.dart';

class LowStockAlertsView extends GetView<LowStockAlertsController> {
  const LowStockAlertsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Low Stock Alerts', style: theme.textTheme.headlineSmall),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Low Stock Alerts Screen',
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
