// author/developer: Buwembo Allan
// page description: This page displays the list of suppliers.
// date: 2025-07-07

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/suppliers/suppliers_controller.dart';

class SuppliersView extends GetView<SuppliersController> {
  const SuppliersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Suppliers', style: theme.textTheme.headlineSmall),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Suppliers Screen',
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
