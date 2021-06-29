import 'package:flutter/material.dart';
import 'package:smsapp/core/utils/screenutils/screen_util.dart';

class BuildAlertDialog extends StatelessWidget {
  final String title;
  final String message;

  const BuildAlertDialog({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: Sizes.dimen_16.ssp,
        ),
      ),
      content: Text(
        message,
        style: TextStyle(
          fontSize: Sizes.dimen_12.ssp,
        ),
      ),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
