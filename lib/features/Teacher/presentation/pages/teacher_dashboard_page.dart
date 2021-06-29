import 'package:flutter/material.dart';
import 'package:smsapp/features/Teacher/presentation/widgets/teacher_dashboard_main.dart';

class TeacherDashboardPage extends StatefulWidget {

  @override
  _TeacherDashboardPageState createState() => _TeacherDashboardPageState();
}

class _TeacherDashboardPageState extends State<TeacherDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherDashboardMain(),
    );
  }
}