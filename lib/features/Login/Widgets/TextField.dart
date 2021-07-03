import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  String hintText, errorText;
  IconData icon;
  TextEditingController controller;
  Function validator;
  Widget suffix;
  bool obscureText;
  FormInputField({this.hintText, this.icon, this.controller, this.validator, this.errorText, this.suffix, this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(minWidth: 50),
          prefixIcon: Icon(
            this.icon,
            size: 16,
          ),
          border: OutlineInputBorder(
            gapPadding: 1,
            borderRadius: BorderRadius.circular(60),
          ),
          hintText: this.hintText,
          hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 12),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          focusColor: Color(0xffF7A529),
          fillColor: Color(0xffF7A529),
          errorText: this.errorText,
          errorStyle: TextStyle(fontSize: 10),
          suffix: this.suffix,
          suffixIconConstraints: BoxConstraints(maxWidth: 10, maxHeight: 10)),
      obscureText: this.obscureText,
      scrollPadding: EdgeInsets.all(0),
      validator: this.validator,
    );
  }
}
