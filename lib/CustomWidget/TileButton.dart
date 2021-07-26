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
            
              child: Icon(
                this.icon,
                size: 25,
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
