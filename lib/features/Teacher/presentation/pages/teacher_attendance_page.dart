import 'package:flutter/material.dart';
import 'package:smsapp/features/Teacher/presentation/widgets/teacher_attendance_main.dart';

class TeacherAttendancePage extends StatefulWidget {

  @override
  _TeacherAttendancePageState createState() => _TeacherAttendancePageState();
}

class _TeacherAttendancePageState extends State<TeacherAttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherAttendanceMain(),
    );
  }
}