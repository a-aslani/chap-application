import 'package:flutter/material.dart';
import 'package:mobile/components/input/text_input_field.dart';
import 'package:mobile/utility/validator.dart';

class VerifyCodeForm extends StatelessWidget {

  final formKey;
  final verifyCodeOnSave;

  VerifyCodeForm({@required this.formKey, @required this.verifyCodeOnSave});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKey,
      child: TextInputField(
          labelText: "کد تایید",
          autofocus: true,
          keyboardType: TextInputType.number,
          onSaved: verifyCodeOnSave,
          validator: (String value) {
            if(isEmpty(value)) {
              return "وارد کردن کد تایید الزامی است";
            }else if(!minLength(value, 5)) {
              return "کد تایید نمیتواند کمتر از 5 عدد باشد";
            }else if(!maxLength(value, 5)) {
              return "کد تایید نمیتواند بیشتر از 5 عدد باشد";
            }else if(!isNumeric(value)) {
              return "کد تایید حتما باید عددی باشد";
            }
          }),
    );
  }
}
