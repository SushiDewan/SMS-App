import 'package:flutter/material.dart';
import 'package:smsapp/features/Teacher/presentation/widgets/teacher_payment_main.dart';

class TeacherPaymentPage extends StatefulWidget {

  @override
  _TeacherPaymentPageState createState() => _TeacherPaymentPageState();
}

class _TeacherPaymentPageState extends State<TeacherPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherPaymentMain(),
    );
  }
}