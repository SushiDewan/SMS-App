import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class EvenTile extends StatelessWidget {
  String title, subtitle;
  EvenTile({this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10, color: Theme.of(context).primaryColor.withOpacity(0.4), offset: Offset(0, 5))]),
        child: ListTile(
          title: Text(
            this.title,
            style: TextStyle(fontFamily: "Varela", fontSize: 18, color: HexColor("#006658"), fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            this.subtitle,
            style: TextStyle(
              fontFamily: "Rubik",
            ),
          ),
        ),
      ),
    );
  }
}
