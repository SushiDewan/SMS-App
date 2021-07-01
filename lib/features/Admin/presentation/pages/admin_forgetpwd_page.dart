import 'package:flutter/material.dart';
import 'package:smsapp/features/Admin/presentation/widgets/admin_forgetpwd_main.dart';


class AdminForgetPwdPage extends StatefulWidget {
  @override
  _AdminForgetPwdPageState createState() => _AdminForgetPwdPageState();
}

class _AdminForgetPwdPageState extends State<AdminForgetPwdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminForgetPwdMain(),
    );
  }
}