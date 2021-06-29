import 'package:flutter/material.dart';
import 'package:smsapp/features/LoginAdmin/presentation/widgets/login_admin_main.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginAdminMain(),
    );
  }
}