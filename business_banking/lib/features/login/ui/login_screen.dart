import 'package:business_banking/features/login/model/login_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class LoginScreen extends Screen {
  final LoginViewModel? viewModel;
  final Function? onChangeUsermame;
  final Function? onChangePassword;
  final Function? onTapSubmit;
  final Function? onTapAccountOnline;
  final Function? onTapForgotPassword;

  LoginScreen({
    this.onChangeUsermame,
    this.onChangePassword,
    this.onTapSubmit,
    this.onTapAccountOnline,
    this.onTapForgotPassword,
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: media.width * .1),
            Container(
              color: Colors.white.withOpacity(.8),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 0),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: Colors.lightGreen),
                  key: Key('signInText'),
                ),
              ),
            ),
            Container(
              color: Colors.white.withOpacity(.8),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                child: Text(
                  'Securely access business banking information',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(height: media.width * .03),
            _textFormField(Key('usename_key'), 'Huntington Username',
                onChangeUsermame, TextInputType.emailAddress),
            SizedBox(height: media.width * .01),
            _textFormField(Key('password_key'), 'Password', onChangePassword,
                TextInputType.visiblePassword),
            SizedBox(height: media.width * .02),
            ElevatedButton(
              key: Key('login_button_key'),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
              ),
              onPressed: onTapSubmit as void Function()?,
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
            Padding(
                padding: EdgeInsets.only(top: 15),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                    child: Text(
                      'Register Account online',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: onTapAccountOnline as void Function()?,
                  )
                ])),
            Padding(
                padding: EdgeInsets.only(top: 15),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: onTapForgotPassword as void Function()?,
                  )
                ])),
          ],
        ),
      ),
    );
  }

  Widget _textFormField(Key key, String hintText, Function? onChangeTextField,
      TextInputType textInputType) {
    return TextFormField(
      key: key,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        filled: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2.0)),
      ),
      onChanged: (value) {
        onChangeTextField!(value);
      },
    );
  }
}
