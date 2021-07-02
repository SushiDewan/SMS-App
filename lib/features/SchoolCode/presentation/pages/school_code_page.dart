import 'package:flutter/material.dart';
import 'package:smsapp/features/SchoolCode/presentation/widgets/school_code_main.dart';

class SchoolCodePage extends StatefulWidget {
  @override
  _SchoolCodePageState createState() => _SchoolCodePageState();
}

class _SchoolCodePageState extends State<SchoolCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SchoolCodeMain(),
    );
  }
}
