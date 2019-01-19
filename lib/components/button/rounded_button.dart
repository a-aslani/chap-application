import 'package:flutter/material.dart';
import 'package:mobile/components/text/large_text.dart';

class RoundedButtonPrimary extends StatelessWidget {

  final onPressed;
  final text;
  final isSending;

  RoundedButtonPrimary({@required this.onPressed, @required this.text, this.isSending: false});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: LargeText(text: isSending ? "در حال ارسال ..." : this.text, color: Colors.white),
      ),
      color: Theme.of(context).primaryColor,
      shape: OutlineInputBorder(
          borderSide:
          BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(25)),
    );
  }
}

class RoundedButton extends StatelessWidget {

  final onPressed;
  final text;
  final color;

  RoundedButton({@required this.onPressed, @required this.text, @required this.color});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: LargeText(text: this.text),
      ),
      color: this.color,
      shape: OutlineInputBorder(
          borderSide:
          BorderSide(color: this.color),
          borderRadius: BorderRadius.circular(25)),
    );
  }
}

class RoundedButtonBordered extends StatelessWidget {

  final onPressed;
  final text;
  final borderColor;

  RoundedButtonBordered({@required this.onPressed, @required this.text, @required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: LargeTextPrimary(text: this.text),
      ),
      color: Colors.white,
      shape: OutlineInputBorder(
          borderSide:
          BorderSide(color: this.borderColor),
          borderRadius: BorderRadius.circular(25)),
    );
  }
}