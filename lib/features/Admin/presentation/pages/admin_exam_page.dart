import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_exam_main.dart';

class AdminExamPage extends StatefulWidget {

  @override
  _AdminExamPageState createState() => _AdminExamPageState();
}

class _AdminExamPageState extends State<AdminExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminExamMain(),
    );
  }
}