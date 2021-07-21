import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  IconData icon;
  String title;
  Function onPressed;
  TileButton({this.icon, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [],
        border: Border.all(color: Colors.black26),
      ),
      child: InkWell(
        onTap: this.onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: 70,
              // width: 70,
              // decoration: BoxDecoration(
              //   color: Theme.of(context).accentColor,
              //   // shape: BoxShape.circle
              // ),
              child: Icon(
                this.icon,
                size: 25,
                // color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(this.title, style: TextStyle(color: Colors.black, fontFamily: "Varela", fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
