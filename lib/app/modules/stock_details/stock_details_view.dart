// author/developer: Buwembo Allan
// page description: This page displays the details of a specific product.
// date: 2025-07-06

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/stock_details/stock_details_controller.dart';

class StockDetailsView extends GetView<StockDetailsController> {
  const StockDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Details', style: theme.textTheme.headlineSmall),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Stock Details Screen',
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
