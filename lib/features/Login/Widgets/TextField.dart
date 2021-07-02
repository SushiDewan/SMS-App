import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormInputField extends StatelessWidget {
  String hintText;
  IconData icon;
  TextEditingController controller;
  Function validator;
  FormInputField({this.hintText, this.icon, this.controller, this.validator});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      // color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.only(left: 40, right: 20, bottom: 10, top: 10),
        child: TextFormField(
          controller: this.controller,
          decoration: InputDecoration(
            suffixIcon: Icon(
              this.icon,
              size: 20,
            ),
            border: InputBorder.none,
            hintText: this.hintText,
            hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
            // contentPadding: EdgeInsets.symmetric(vertical: 5),
          ),
          scrollPadding: EdgeInsets.all(0),
          validator: this.validator,
        ),
      ),
    );
  }
}
