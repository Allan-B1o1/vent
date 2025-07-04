// author/developer: Buwembo Allan
// page description: This page displays the list of suppliers.
// date: 2025-07-07

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/modules/suppliers/suppliers_controller.dart';
import 'package:vent/theme/color_schemes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vent/app/data/models/supplier_model.dart';

class SuppliersView extends GetView<SuppliersController> {
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suppliers'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.plusCircle),
            onPressed: () {
              _showAddEditSupplierDialog(context);
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.suppliers.length,
                itemBuilder: (context, index) {
                  final supplier = controller.suppliers[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ListTile(
                      title: Text(supplier.name, style: Get.textTheme.titleMedium),
                      subtitle: Text(
                        'Contact: ${supplier.contactPerson} | Phone: ${supplier.phone}',
                        style: Get.textTheme.bodySmall,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(FeatherIcons.edit, color: primaryColor),
                            onPressed: () {
                              _showAddEditSupplierDialog(context, supplier: supplier);
                            },
                          ),
                          IconButton(
                            icon: const Icon(FeatherIcons.trash2, color: accentColor),
                            onPressed: () {
                              Get.defaultDialog(
                                title: "Delete Supplier",
                                middleText: "Are you sure you want to delete ${supplier.name}?",
                                textConfirm: "Delete",
                                textCancel: "Cancel",
                                confirmTextColor: primaryTextColor,
                                buttonColor: accentColor,
                                onConfirm: () {
                                  // controller.deleteSupplier(supplier.id!);
                                  Get.back();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _showAddEditSupplierDialog(BuildContext context, {Supplier? supplier}) {
    final isEditing = supplier != null;
    final TextEditingController nameController = TextEditingController(text: supplier?.name ?? '');
    final TextEditingController contactPersonController = TextEditingController(text: supplier?.contactPerson ?? '');
    final TextEditingController emailController = TextEditingController(text: supplier?.email ?? '');
    final TextEditingController phoneController = TextEditingController(text: supplier?.phone ?? '');
    final TextEditingController addressController = TextEditingController(text: supplier?.address ?? '');
    final RxBool isPreferred = (supplier?.isPreferred ?? false).obs;

    Get.defaultDialog(
      title: isEditing ? 'Edit Supplier' : 'Add Supplier',
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Supplier Name'),
            ),
            TextField(
              controller: contactPersonController,
              decoration: const InputDecoration(labelText: 'Contact Person'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            Obx(() => CheckboxListTile(
                  title: const Text('Preferred Supplier'),
                  value: isPreferred.value,
                  onChanged: (bool? value) {
                    isPreferred.value = value ?? false;
                  },
                )),
          ],
        ),
      ),
      textConfirm: isEditing ? 'Update' : 'Add',
      textCancel: 'Cancel',
      confirmTextColor: primaryTextColor,
      buttonColor: primaryColor,
      onConfirm: () {
        // if (isEditing) {
        //   controller.updateSupplier(supplier!.copyWith(
        //     name: nameController.text,
        //     contactPerson: contactPersonController.text,
        //     email: emailController.text,
        //     phone: phoneController.text,
        //     address: addressController.text,
        //     isPreferred: isPreferred.value,
        //     updatedAt: DateTime.now(),
        //   ));
        // } else {
        //   controller.addSupplier(
        //     name: nameController.text,
        //     contactPerson: contactPersonController.text,
        //     email: emailController.text,
        //     phone: phoneController.text,
        //     address: addressController.text,
        //     isPreferred: isPreferred.value,
        //   );
        // }
        Get.back();
      },
    );
  }
}
