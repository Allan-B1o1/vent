import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class DashboardController extends GetxController {
  var totalProducts = 0.obs;
  var lowStockCount = 0.obs;
  var outOfStockCount = 0.obs;
  var totalSuppliers = 0.obs;

  RxList<PieChartSectionData> pieChartSections = <PieChartSectionData>[].obs;
  RxList<BarChartGroupData> barChartGroups = <BarChartGroupData>[].obs;
  RxList<FlSpot> stockMovementSpots = <FlSpot>[].obs;
  RxList<Map<String, dynamic>> topLowStockItems = <Map<String, dynamic>>[].obs;
  RxList<PieChartSectionData> productStatusSections = <PieChartSectionData>[].obs;
  RxList<PieChartSectionData> supplierContributionSections = <PieChartSectionData>[].obs;
  RxList<Activity> recentActivities = <Activity>[].obs;
  RxList<Alert> alerts = <Alert>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  void fetchDashboardData() {
    // Simulate fetching data (mocked)
    totalProducts.value = 1250;
    lowStockCount.value = 15;
    outOfStockCount.value = 5;
    totalSuppliers.value = 20;

    // Mock data for Inventory Distribution Pie Chart
    pieChartSections.value = [
      PieChartSectionData(
        color: Colors.blue,
        value: 40,
        title: '40%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 30,
        title: '30%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 15,
        title: '15%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 15,
        title: '15%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];

    // Mock data for Stock Levels Bar Chart
    barChartGroups.value = [
      BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8, color: Colors.cyan)]),
      BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10, color: Colors.purple)]),
      BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14, color: Colors.amber)]),
      BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15, color: Colors.greenAccent)]),
      BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 13, color: Colors.redAccent)]),
    ];

    // Mock data for Stock Movement Line Chart
    stockMovementSpots.value = [
      const FlSpot(0, 3),
      const FlSpot(1, 2),
      const FlSpot(2, 5),
      const FlSpot(3, 3),
      const FlSpot(4, 4),
      const FlSpot(5, 3),
      const FlSpot(6, 4),
    ];

    // Mock data for Top Low-Stock Items List
    topLowStockItems.value = [
      {'name': 'Product A', 'quantity': 5, 'category': 'Electronics'},
      {'name': 'Product B', 'quantity': 8, 'category': 'Apparel'},
      {'name': 'Product C', 'quantity': 3, 'category': 'Groceries'},
      {'name': 'Product D', 'quantity': 10, 'category': 'Home Goods'},
    ];

    // Mock data for Product Status Donut Chart
    productStatusSections.value = [
      PieChartSectionData(
        color: Colors.green,
        value: 70,
        title: '70%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 20,
        title: '20%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 10,
        title: '10%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];

    // Mock data for Supplier Contribution Pie/Bar Chart
    supplierContributionSections.value = [
      PieChartSectionData(
        color: Colors.deepPurple,
        value: 50,
        title: 'Supplier X',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.indigo,
        value: 30,
        title: 'Supplier Y',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.blueGrey,
        value: 20,
        title: 'Supplier Z',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];

    // Mock data for Recent Activities
    recentActivities.value = [
      Activity(title: 'Added 50 units of Product A', timestamp: '2 hours ago', icon: FeatherIcons.plusCircle),
      Activity(title: 'Removed 10 units of Product C', timestamp: '1 day ago', icon: FeatherIcons.minusCircle),
      Activity(title: 'New supplier added: Supplier X', timestamp: '3 days ago', icon: FeatherIcons.userPlus),
      Activity(title: 'Stock update for Product B', timestamp: '5 days ago', icon: FeatherIcons.refreshCw),
    ];

    // Mock data for Alerts & Notifications
    alerts.value = [
      Alert(message: 'Product D is below minimum stock!', timestamp: '1 hour ago', type: 'critical', icon: FeatherIcons.alertCircle),
      Alert(message: 'Supplier Y delivery delayed.', timestamp: '4 hours ago', type: 'warning', icon: FeatherIcons.info),
    ];
  }

  void dismissAlert(int index) {
    alerts.removeAt(index);
  }
}

class Activity {
  final String title;
  final String timestamp;
  final IconData icon;

  Activity({required this.title, required this.timestamp, required this.icon});
}

class Alert {
  final String message;
  final String timestamp;
  final String type; // 'warning' or 'critical'
  final IconData icon;

  Alert({required this.message, required this.timestamp, required this.type, required this.icon});
}
