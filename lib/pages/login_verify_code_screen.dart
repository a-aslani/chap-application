import 'package:flutter/material.dart';
import 'package:mobile/components/button/rounded_button.dart';
import 'package:mobile/components/pages/login/verify_code_form.dart';
import 'package:mobile/components/text/large_text.dart';
import 'package:mobile/service/api/api_service.dart';
import 'package:mobile/service/prefs.dart';

class LoginVerifyCodeScreen extends StatefulWidget {

  final phoneNumber;

  LoginVerifyCodeScreen({@required this.phoneNumber});

  @override
  LoginVerifyCodeScreenState createState() {
    return new LoginVerifyCodeScreenState();
  }
}

class LoginVerifyCodeScreenState extends State<LoginVerifyCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _showRecode = false;
  String _message = "";
  bool _isSending = false;
  String _verifyCode;


  _verifyCodeOnSave(String value) {
    this._verifyCode = value;
  }

  _btnSendVerifyCodeOnPressed() async {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _isSending = true;
      });
      try {
        var response = await ApiService().sendVerifyCode(widget.phoneNumber, _verifyCode);
        if(!response["state"]) {

          setState(() {
            _isSending = false;
          });

          setState(() {
            this._showRecode = true;
            this._message = response["data"]["message"];
          });

        } else {

          saveApiToken(response["data"]["api_token"]);

          if(!response["data"]["is_new_user"]) {
            var user = await ApiService().fetchUser();
            setFullName(user["name"], user["family"]);
            Navigator.of(context).pushReplacementNamed("/home");
          }else {
            Navigator.of(context).pushReplacementNamed("/register");
          }
        }

      }catch(e) {
        setState(() {
          _isSending = false;
        });
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.toString(), style: TextStyle(fontFamily: "IranYekan")), duration: Duration(seconds: 7)));
      }

    }
  }

  _btnReCodeOnPressed() async {
    try {

      await ApiService().recode(widget.phoneNumber);

      setState(() {
        _showRecode = false;
      });

    }catch(e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.toString(), style: TextStyle(fontFamily: "IranYekan")), duration: Duration(seconds: 7)));
    }
  }

  _registerWidgets(Size size) => <Widget>[
    Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: LargeTextBold(text: "تایید شماره موبایل")
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: VerifyCodeForm(formKey: _formKey, verifyCodeOnSave: _verifyCodeOnSave),
    ),
    Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: RoundedButtonPrimary(text: "ارسال", onPressed: _btnSendVerifyCodeOnPressed, isSending: _isSending),
    ),
    Text("کد تایید به شماره موبایل شما ارسال میگردد"),
    SizedBox(height: 8.0),
    Text("مدت زمان اعتبار کد 3 دقیقه میباشد"),
  ];

  _reCodeWidgets(Size size) => <Widget>[
    Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Text(this._message)
    ),
    Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: RoundedButtonPrimary(text: "ارسال مجدد کد تایید", onPressed: _btnReCodeOnPressed),
    )
  ];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: !_showRecode ? _registerWidgets(size) : _reCodeWidgets(size)
        ),
      ),
    );
  }
}

