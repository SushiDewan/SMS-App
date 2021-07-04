import 'package:flutter/material.dart';
import 'package:smsapp/features/ForgetSchoolCode/presentation/widgets/forget_sclcode_main.dart';

class ForgetSclCodePage extends StatefulWidget {

  @override
  _ForgetSclCodePageState createState() => _ForgetSclCodePageState();
}

class _ForgetSclCodePageState extends State<ForgetSclCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetSclCodeMain(),
    );
  }
}