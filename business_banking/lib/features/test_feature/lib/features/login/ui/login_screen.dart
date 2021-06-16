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
      extendBodyBehindAppBar: false,
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
                    left: 0,
                    right: 0,
                    top: 75,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 4,
                                left: 20,
                              ),
                              child: textRegular(
                                "Username",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Arial",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: textFormField(
                                      context,
                                      "",
                                      TextInputType.text,
                                      size: 14.0,
                                      fieldSubmitted: (value) {},
                                      onChangeValue: (value) {},
                                      action: TextInputAction.next,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Opacity(
                                    opacity: 0.8026878720238095,
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      margin:
                                          EdgeInsets.only(left: 10, right: 20),
                                      child: Column(
                                        children: [
                                          Icon(Icons.check_box_outline_blank,
                                              size: 24),
                                          textRegular("Save",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: "Arial",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0,
                                              ),
                                              textAlign: TextAlign.center)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 4.0,
                                left: 20.0,
                                top: 16.0,
                              ),
                              child: textRegular(
                                "Company ID",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Arial",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20.0,
                                right: 60.0,
                              ),
                              child: textFormField(
                                context,
                                "",
                                TextInputType.text,
                                size: 14.0,
                                fieldSubmitted: (value) {},
                                onChangeValue: (value) {},
                                action: TextInputAction.next,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 4.0,
                                left: 20.0,
                                top: 16.0,
                              ),
                              child: textRegular(
                                "Password",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Arial",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20.0,
                                right: 60.0,
                              ),
                              child: textFormField(
                                context,
                                "",
                                TextInputType.text,
                                size: 14.0,
                                fieldSubmitted: (value) {},
                                onChangeValue: (value) {},
                                action: TextInputAction.done,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 4.0,
                                left: 20.0,
                                top: 16.0,
                              ),
                              child: textRegular(
                                "Forgot Username or Password",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Arial",
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 60, top: 36.0),
                                  child: buttonRegular("Log In", width: 120.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 0.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 8.0,
                                    top: 16.0,
                                  ),
                                  child: textRegular(
                                    "Contact Us",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "Arial",
                                      decoration: TextDecoration.underline,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.black12,
                                  padding: EdgeInsets.only(
                                    bottom: 16.0,
                                    left: 16.0,
                                    right: 16.0,
                                    top: 16.0,
                                  ),
                                  child: textRegular(
                                    "Member FDIC. Logo and Huntington are federally registered trademarks Huntington Bancshares Incorporated. 2020Huntigton BANCSHARES inc",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 1.3,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "Arial",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ), //Your widget here,
                          ),
                        ),
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
