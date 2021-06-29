import 'package:flutter/material.dart';
import 'package:smsapp/features/Teacher/presentation/widgets/teacher_leave_main.dart';

class TeacherLeavePage extends StatefulWidget {

  @override
  _TeacherLeavePageState createState() => _TeacherLeavePageState();
}

class _TeacherLeavePageState extends State<TeacherLeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherLeaveMain(),
    );
  }
}