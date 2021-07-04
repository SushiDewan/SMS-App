import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_subject_main.dart';

class AdminSubjectPage extends StatefulWidget {

  @override
  _AdminSubjectPageState createState() => _AdminSubjectPageState();
}

class _AdminSubjectPageState extends State<AdminSubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminSubjectMain(),
    );
  }
}