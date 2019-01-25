import 'package:flutter/material.dart';
import 'package:mobile/components/button/rounded_button.dart';
import 'package:mobile/components/pages/login/phone_number_form.dart';
import 'package:mobile/components/snackbar/app_snackbar.dart';
import 'package:mobile/components/text/large_text.dart';
import 'package:mobile/pages/login_verify_code_screen.dart';
import 'package:mobile/service/api/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _phoneNumber;

  bool _isSending = false;

  _phoneNumberOnSave(String value) {
    this._phoneNumber = value;
  }

  _btnOnPressed() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _isSending = true;
      });

      try {
        var response = await ApiService().sendPhoneNumber(_phoneNumber);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: LoginVerifyCodeScreen(
                    phoneNumber: response["phone_number"]))));
      } catch (e) {
        setState(() {
          _isSending = false;
        });
        AppSnackbar.show(_scaffoldKey, e.toString(), 7);
      }
    }
  }

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
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: LargeTextBold(text: "ورود و عضویت")),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PhoneNumberForm(
                    formKey: _formKey, phoneNumberOnSave: _phoneNumberOnSave),
              ),
              Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 24.0),
                child: RoundedButtonPrimary(
                    text: "ارسال",
                    onPressed: _btnOnPressed,
                    isSending: _isSending),
              ),
              Text("شماره موبایل خود را بدون 0 ابتدایی وارد نمایید")
            ]),
      ),
    );
  }
}
