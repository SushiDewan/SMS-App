import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_dashboard_main.dart';

class AdminDashboardPage extends StatefulWidget {
  @override
  _AdminDashboardPageState createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminDashboardMain(),
    );
  }
}