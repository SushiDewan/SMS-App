import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_profile_main.dart';

class AdminProfilePage extends StatefulWidget {

  @override
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminProfileMain(),
    );
  }
}