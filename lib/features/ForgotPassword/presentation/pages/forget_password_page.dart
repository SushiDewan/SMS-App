import 'package:flutter/material.dart';
import 'package:smsapp/features/ForgotPassword/presentation/widgets/forget_password_main.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPasswordMain(),
    );
  }
}