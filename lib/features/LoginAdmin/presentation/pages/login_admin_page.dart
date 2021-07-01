import 'package:flutter/material.dart';
import 'package:smsapp/features/LoginAdmin/presentation/widgets/login_admin_main.dart';

class LoginAdminPage extends StatefulWidget {

  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginAdminMain(),
    );
  }
}