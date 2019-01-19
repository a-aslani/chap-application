import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {

  final String text;
  final color;

  LargeText({@required this.text, this.color: Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: TextStyle(color: this.color, fontSize: 18));
  }
}

class LargeTextBold extends StatelessWidget {

  final String text;
  final color;

  LargeTextBold({@required this.text, this.color: Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: TextStyle(color: this.color, fontSize: 18, fontWeight: FontWeight.bold));
  }
}

class LargeTextPrimaryBold extends StatelessWidget {

  final String text;

  LargeTextPrimaryBold({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18, fontWeight: FontWeight.bold));
  }
}

class LargeTextPrimary extends StatelessWidget {

  final String text;

  LargeTextPrimary({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18));
  }
}