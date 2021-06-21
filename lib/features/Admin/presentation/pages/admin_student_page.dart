import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_student_body.dart';

class AdminStudentPage extends StatefulWidget {

  @override
  _AdminStudentPageState createState() => _AdminStudentPageState();
}

class _AdminStudentPageState extends State<AdminStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminStudentBody(),
    );
  }
}