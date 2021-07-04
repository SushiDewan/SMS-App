import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smsapp/features/Admin/presentation/pages/admin_event_page.dart';

class TileButton extends StatelessWidget {
  IconData icon;
  String title;
  Function onPressed;
  TileButton({this.icon, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(3, 3),
        )
      ]),
      child: InkWell(
        onTap: this.onPressed,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Icon(
                this.icon,
                size: 30,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(this.title, style: TextStyle(color: Colors.black, fontFamily: "Libre", fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
