import 'package:business_banking/features/forgot_username/model/forgot_password_view_model.dart';
import 'package:business_banking/utils/email_address_validator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends Screen {
  final ForgotPasswordViewModel? viewModel;
  final Function? onTapSubmit;
  final GlobalKey<FormState> forgotPasswordFormKey;

  ForgotPasswordScreen({
    this.onTapSubmit,
    this.viewModel,
    required this.forgotPasswordFormKey
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Form(
        key: forgotPasswordFormKey,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: media.width * .1),
            Container(
              color: Colors.white.withOpacity(.8),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                child: Text(
                  'Enter the email associated with your account to receive password reset link',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(height: media.width * .03),
            _textFormField(Key('email_key'), 'Email address',
                TextInputType.emailAddress),
            SizedBox(height: media.width * .02),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
              ),
              onPressed: onTapSubmit as void Function()?,
              child: Text('Send', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormField(Key key, String hintText, TextInputType textInputType) {
    return TextFormField(
      key: key,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.alternate_email),
        filled: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2.0)),
      ),
      validator: (value) {
        return validateEmail(value);
      }
    );
  }
}
