import 'package:flutter/material.dart';
import 'package:smsapp/features/Teacher/presentation/widgets/teacher_event_main.dart';

class TeacherEventPage extends StatefulWidget {

  @override
  _TeacherEventPageState createState() => _TeacherEventPageState();
}

class _TeacherEventPageState extends State<TeacherEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherEventMain(),
    );
  }
}