import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final bool isPassword;
  final int maxLength;
  final TextInputType keyBoardType;
  final String? status;
  final TextEditingController? textEditingController;
  final Key? textFieldKey;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.maxLength = 32,
    this.keyBoardType = TextInputType.text,
    this.status,
    this.textEditingController,
    this.textFieldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(children: [
          TextFormField(
            key: textFieldKey,
            controller: textEditingController,
            maxLength: maxLength,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.all(15.0),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[200],
            ),
            obscureText: isPassword ? true : false,
            validator: validator,
            onSaved: onSaved,
            keyboardType: keyBoardType,
          ),
          if (status!.isNotEmpty)
            Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Row(children: [
                  Expanded(
                      child: Text(
                    status!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  )),
                ])),
        ]));
  }
}
