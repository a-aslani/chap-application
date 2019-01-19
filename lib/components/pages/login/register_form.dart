import 'package:flutter/material.dart';
import 'package:mobile/components/input/text_input_field.dart';
import 'package:mobile/utility/validator.dart';

class RegisterForm extends StatelessWidget {
  final formKey;
  final nameOnSave;
  final familyOnSave;

  RegisterForm({@required this.formKey, @required this.nameOnSave, @required this.familyOnSave});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKey,
      child: Column(
        children: <Widget>[
          TextInputField(
              labelText: "نام",
              autofocus: true,
              textDirection: TextDirection.rtl,
              onSaved: nameOnSave,
              validator: (String value) {
                if(isEmpty(value)) {
                  return "وارد کردن نام الزامی است";
                }
              }),
          SizedBox(height: 32.0),
          TextInputField(
              labelText: "نام خانوادگی",
              textDirection: TextDirection.rtl,
              onSaved: familyOnSave,
              validator: (String value) {
                if(isEmpty(value)) {
                  return "وارد کردن نام خانوادگی الزامی است";
                }
              })
        ],
      ),
    );
  }
}
