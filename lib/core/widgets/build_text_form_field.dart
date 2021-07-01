
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String) onSaved;
  final Function(String) onChanged;
  final String Function(String) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter> textInputFormatter;
  final FocusNode focusNode;
  final bool autoCapatalize;
  final int maxLength;
  final int maxLines;
  final int minLines;
  final String errorText;
final TextEditingController controller;

  const BuildTextFormField({
    Key key,
    this.hintText,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.textInputFormatter,
    this.focusNode,
    this.autoCapatalize = false,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.controller,
    this.errorText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      focusNode: focusNode,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      textCapitalization:
          autoCapatalize ? TextCapitalization.words : TextCapitalization.none,
      keyboardType: keyboardType,
      inputFormatters: textInputFormatter,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12,
        ),
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
        fillColor: Colors.white.withOpacity(0.7),
        filled: true,
      ),
      obscureText: obscureText,
      // validator: validator ??
      //     (value) => value.isEmpty ? "$hintText must not be empty." : null,
      onSaved: onSaved,
      onChanged: onChanged,
      controller: controller,
      
    );
  }
}
