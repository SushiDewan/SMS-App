import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_event_main.dart';


class AdminEventPage extends StatefulWidget {

  @override
  _AdminEventPageState createState() => _AdminEventPageState();
}

class _AdminEventPageState extends State<AdminEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminEventMain()
    );
  }
}