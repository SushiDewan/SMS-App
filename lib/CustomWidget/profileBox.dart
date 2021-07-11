import 'package:flutter/material.dart';
import 'package:smsapp/CustomWidget/TextField.dart';

class ProfileBox extends StatelessWidget {
  final String title;
  ProfileBox({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Theme.of(context).accentColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Varela"),
            ),
            Container(width: 200, child: FormInputField())
          ],
        ),
      ),
    );
  }
}
