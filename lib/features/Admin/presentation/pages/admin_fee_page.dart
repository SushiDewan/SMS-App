import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_fee_main.dart';

class AdminFeePage extends StatefulWidget {

  @override
  _AdminFeePageState createState() => _AdminFeePageState();
}

class _AdminFeePageState extends State<AdminFeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminFeeMain(),
    );
  }
}