import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color color;

  const BuildButton({
    Key key,
    @required this.title,
    @required this.onTap,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Theme.of(context).accentColor,
      height: 50,
      onPressed: onTap,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontFamily: "Varela",
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 12,
          letterSpacing: 0.7,
        ),
      ),
    );
  }
}
