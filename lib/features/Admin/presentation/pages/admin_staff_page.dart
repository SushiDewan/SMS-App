import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_staff_main.dart';

class AdminStaffPage extends StatefulWidget {

  @override
  _AdminStaffPageState createState() => _AdminStaffPageState();
}

class _AdminStaffPageState extends State<AdminStaffPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminStaffMain(),
    );
  }
}