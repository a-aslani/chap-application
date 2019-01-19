import 'package:flutter/material.dart';
import 'package:mobile/components/button/rounded_button.dart';
import 'package:mobile/components/pages/login/register_form.dart';
import 'package:mobile/components/text/large_text.dart';
import 'package:mobile/service/api/api_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() {
    return new RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _name;
  String _family;
  bool _isSending = false;

  _nameOnSave(String value) {
    this._name = value;
  }

  _familyOnSave(String value) {
    this._family = value;
  }

  _btnOnPressed() async {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _isSending = true;
      });
      try {
        await ApiService().register(_name, _family);
        Navigator.of(context).pushReplacementNamed("/home");
      }catch(e) {
        setState(() {
          _isSending = false;
        });
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.toString())));
      }

    }
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: LargeTextBold(text: "تکمیل اطلاعات کاربری")
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: RegisterForm(formKey: _formKey, nameOnSave: _nameOnSave, familyOnSave: _familyOnSave),
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                  child: RoundedButtonPrimary(text: "عضویت", onPressed: _btnOnPressed, isSending: _isSending),
                )
              ]),
        ),
      ),
    );
  }
}

