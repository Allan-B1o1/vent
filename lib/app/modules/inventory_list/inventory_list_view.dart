// author/developer: Buwembo Allan
// page description: This page displays the list of inventory products.
// date: 2025-07-04

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/inventory_list/inventory_list_controller.dart';

class InventoryListView extends GetView<InventoryListController> {
  const InventoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // Scaffold background is handled by the global theme
      appBar: AppBar(
        // AppBar styling is handled by the global theme
        title: Text('Inventory List', style: theme.textTheme.headlineSmall),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Inventory List Screen',
          style: theme.textTheme.titleLarge, // Using a theme text style
        ),
      ),
    );
  }
}
