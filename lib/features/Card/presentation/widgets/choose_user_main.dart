import 'package:flutter/material.dart';
import 'package:smsapp/features/Card/presentation/widgets/choose_user_body.dart';

class ChooseUserMain extends StatelessWidget {
final String id;
  ChooseUserMain(this.id);
  @override
  Widget build(BuildContext context) {
    
    return ChooseUserBody(
      this.id
    );
  }
}