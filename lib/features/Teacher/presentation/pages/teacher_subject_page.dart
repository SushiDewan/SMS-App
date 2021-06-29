import 'package:flutter/material.dart';
import 'package:smsapp/features/Teacher/presentation/widgets/teacher_subject_main.dart';

class TeacherSubjectPage extends StatefulWidget {
  @override
  _TeacherSubjectPageState createState() => _TeacherSubjectPageState();
}

class _TeacherSubjectPageState extends State<TeacherSubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherSubjectMain(),
    );
  }
}