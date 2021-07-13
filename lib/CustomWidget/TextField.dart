import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  String hintText, errorText;
  TextInputType keyboardType;
  IconData icon;
  TextEditingController controller;
  Function validator, onSuffixPressed;
  IconData suffix;
  bool obscureText;
  FormInputField(
      {this.keyboardType,
      this.hintText,
      this.icon,
      this.controller,
      this.validator,
      this.errorText,
      this.suffix,
      this.obscureText = false,
      this.onSuffixPressed});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: Theme.of(context).accentColor, width: 1.0),
        ),
        prefixIcon: Icon(
          this.icon,
          size: 14,
          color: Theme.of(context).primaryColor,
        ),
        hintText: this.hintText,
        errorText: this.errorText,
        errorStyle: TextStyle(fontSize: 10),
        suffix: this.suffix != null
            ? IconButton(
                icon: Icon(
                  this.suffix,
                  size: 18,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: this.onSuffixPressed,
              )
            : null,
      ),
      obscureText: this.obscureText,
      validator: this.validator,
    );
  }
}