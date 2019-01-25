import 'package:flutter/material.dart';
import 'package:mobile/service/api/api_service.dart';
import 'package:mobile/service/prefs.dart';
import 'package:mobile/service/application.dart';

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
    if(await ApplicationService().isConnected()) {
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
    } else {

      showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (context) => Directionality(textDirection: TextDirection.rtl, child: AlertDialog(
            title: Text("اینترنت"),
            content: Text("از دسترسی به اینترنت اطمینان حاصل نمایید."),
            actions: <Widget>[
              FlatButton(
                child: Text('تلاش مجدد', style: TextStyle(color: Theme.of(context).primaryColor)),
                onPressed: () {
                  _checkUserLoggedIn();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ))
      );
    }
  }
}
