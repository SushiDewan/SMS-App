import 'package:flutter/material.dart';
import 'package:smsapp/features/Card/presentation/widgets/choose_user_main.dart';

class ChooseUserPage extends StatefulWidget {
  ChooseUserPage({Key key}) : super(key: key);
  @override
  _ChooseUserPageState createState() => _ChooseUserPageState();
}

class _ChooseUserPageState extends State<ChooseUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChooseUserMain(),
    );
  }
}
