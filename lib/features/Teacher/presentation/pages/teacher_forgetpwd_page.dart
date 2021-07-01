import 'package:flutter/material.dart';
import 'package:smsapp/features/Teacher/presentation/widgets/teacher_forgetpwd_main.dart';


class TeacherForgetPwdPage extends StatefulWidget {
  @override
  _TeacherForgetPwdPageState createState() => _TeacherForgetPwdPageState();
}

class _TeacherForgetPwdPageState extends State<TeacherForgetPwdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherForgetPwdMain(),
    );
  }
}