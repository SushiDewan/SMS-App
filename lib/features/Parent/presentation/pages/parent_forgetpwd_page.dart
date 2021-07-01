import 'package:flutter/material.dart';
import 'package:smsapp/features/Parent/presentation/widgets/parent_forgetpwd_main.dart';


class ParentForgetPwdPage extends StatefulWidget {
  @override
  _ParentForgetPwdPageState createState() => _ParentForgetPwdPageState();
}

class _ParentForgetPwdPageState extends State<ParentForgetPwdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ParentForgetPwdMain(),
    );
  }
}