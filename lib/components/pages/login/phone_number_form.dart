import 'package:flutter/material.dart';
import 'package:mobile/components/input/text_input_field.dart';
import 'package:mobile/utility/validator.dart';

class PhoneNumberForm extends StatelessWidget {

  final formKey;
  final phoneNumberOnSave;

  PhoneNumberForm({@required this.formKey, @required this.phoneNumberOnSave});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKey,
      child: TextInputField(
          labelText: "شماره موبایل",
          autofocus: true,
          keyboardType: TextInputType.number,
          onSaved: phoneNumberOnSave,
          validator: (String value) {
            if(isEmpty(value)) {
              return "وارد کردن شماره موبایل الزامی است";
            }else if(startedWith(value, "0")) {
              return "شماره موبایل خود را بدون 0 ابتدایی وارد نمایید";
            }else if(!minLength(value, 10)) {
              return "شماره موبایل نمیتواند کمتر از 10 عدد باشد";
            }else if(!maxLength(value, 10)) {
              return "شماره موبایل نمیتواند بیشتر از 10 عدد باشد";
            }else if(!isNumeric(value)) {
              return "شماره موبایل حتما باید عددی باشد";
            }
          }),
    );
  }
}
