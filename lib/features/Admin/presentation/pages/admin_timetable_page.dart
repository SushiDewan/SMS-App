import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_timetable_main.dart';

class AdminTimetablePage extends StatefulWidget {

  @override
  _AdminTimetablePageState createState() => _AdminTimetablePageState();
}

class _AdminTimetablePageState extends State<AdminTimetablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminTimetableMain(),
    );
  }
}