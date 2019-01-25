import 'package:flutter/material.dart';

class AppSnackbar {

  static show(GlobalKey<ScaffoldState> scaffoldKey, String message, int duration) => scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message, style: TextStyle(fontFamily: "IranYekan")), duration: Duration(seconds: duration)));

}
