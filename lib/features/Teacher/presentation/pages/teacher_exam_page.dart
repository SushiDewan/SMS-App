import 'package:flutter/material.dart';
import 'package:smsapp/features/Teacher/presentation/widgets/teacher_exam_main.dart';

class TeacherExamPage extends StatefulWidget {

  @override
  _TeacherExamPageState createState() => _TeacherExamPageState();
}

class _TeacherExamPageState extends State<TeacherExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherExamMain(),
    );
  }
}