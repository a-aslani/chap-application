import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {

  final autofocus;
  final keyboardType;
  final textDirection;
  final labelText;
  final obscureText;
  final onSaved;
  final validator;

  TextInputField(
      {@required this.labelText,
      this.obscureText: false,
      this.autofocus: false,
      this.keyboardType: TextInputType.text,
      this.textDirection: TextDirection.ltr,
      @required this.onSaved,
      @required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: this.obscureText,
        autofocus: this.autofocus,
        keyboardType: this.keyboardType,
        textDirection: this.textDirection,
        onSaved: this.onSaved,
        validator: this.validator,
        decoration: InputDecoration(
            labelText: this.labelText,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38)),
            hasFloatingPlaceholder: true));
  }
}
