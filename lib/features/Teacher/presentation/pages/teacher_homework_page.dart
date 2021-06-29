import 'package:flutter/material.dart';
import 'package:smsapp/features/Teacher/presentation/widgets/teacher_homework_main.dart';

class TeacherHomeworkpage extends StatefulWidget {

  @override
  _TeacherHomeworkpageState createState() => _TeacherHomeworkpageState();
}

class _TeacherHomeworkpageState extends State<TeacherHomeworkpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherHomeworkMain(),
    );
  }
}