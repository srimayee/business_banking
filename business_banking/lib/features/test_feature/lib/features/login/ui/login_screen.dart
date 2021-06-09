import 'package:business_banking/features/test_feature/lib/globals/custom_styles.dart';
import 'package:business_banking/features/test_feature/lib/utils/login_textfield.dart';
import 'package:business_banking/features/test_feature/lib/utils/regular_button.dart';
import 'package:business_banking/features/test_feature/lib/utils/regular_text.dart';
import 'package:flutter/material.dart';

class LoginScreenView extends StatefulWidget {
  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth),
              child: IntrinsicHeight(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 32,
                    right: 32,
                    top: 25,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textRegular(
                        "Username",
                        paddingAroundButton: EdgeInsets.only(
                          bottom: 4,
                        ),
                        style: CustomStyles().formFieldTextStyle,
                      ),
                      textFormField(
                        context,
                        "",
                        TextInputType.text,
                        size: 14.0,
                        fieldSubmitted: (value) {},
                        onChangeValue: (value) {},
                        action: TextInputAction.next,
                        inputFormatterList: [],
                      ),
                      textRegular(
                        "Company ID",
                        paddingAroundButton: EdgeInsets.only(
                          bottom: 4.0,
                          top: 16.0,
                        ),
                        style: CustomStyles().formFieldTextStyle,
                      ),
                      textFormField(
                        context,
                        "",
                        TextInputType.text,
                        size: 14.0,
                        fieldSubmitted: (value) {},
                        onChangeValue: (value) {},
                        action: TextInputAction.next,
                        inputFormatterList: [],
                      ),
                      textRegular(
                        "Password",
                        paddingAroundButton: EdgeInsets.only(
                          bottom: 4.0,
                          top: 16.0,
                        ),
                        style: CustomStyles().formFieldTextStyle,
                      ),
                      textFormField(
                        context,
                        "",
                        TextInputType.text,
                        size: 14.0,
                        fieldSubmitted: (value) {},
                        onChangeValue: (value) {},
                        action: TextInputAction.done,
                        inputFormatterList: [],
                      ),
                      textRegular(
                        "Forgot Username or Password",
                        paddingAroundButton: EdgeInsets.only(
                          bottom: 4.0,
                          top: 16.0,
                        ),
                        style: CustomStyles().formFieldTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 36.0),
                            child: buttonRegular("Log In", width: 120.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
