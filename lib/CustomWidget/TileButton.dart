import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  IconData icon;
  String title;
  Function onPressed;
  TileButton({this.icon, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: []),
      child: InkWell(
        onTap: this.onPressed,
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                shape: BoxShape.circle
              ),
              child: Icon(
                this.icon,
                size: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(this.title,
                style: TextStyle(
                    color: Colors.black, fontFamily: "Varela", fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
