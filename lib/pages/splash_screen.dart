import 'package:flutter/material.dart';
import 'package:mobile/service/api/api_service.dart';
import 'package:mobile/service/prefs.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _checkUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      key: _scaffoldKey,
      body: Center(
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
      ),
    );
  }

  _checkUserLoggedIn() async {
    try {
      var response = await ApiService().fetchUser();
      if(response["name"] == null) {
        Navigator.of(context).pushReplacementNamed("/register");
      } else {
        setFullName(response["name"], response["family"]);
        Navigator.of(context).pushReplacementNamed("/home");
      }
    } catch (e) {
      Navigator.of(context).pushReplacementNamed("/login");
    }
  }
}
