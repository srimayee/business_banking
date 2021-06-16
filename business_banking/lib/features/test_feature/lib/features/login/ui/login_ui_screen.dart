import 'package:business_banking/features/test_feature/lib/features/login/ui/check_box.dart';
import 'package:business_banking/features/test_feature/lib/features/login/ui/check_device_util.dart';
import 'package:business_banking/features/test_feature/lib/features/login/ui/link_text.dart';
import 'package:business_banking/features/test_feature/lib/features/login/ui/primary_button.dart';
import 'package:business_banking/features/test_feature/lib/features/login/ui/text_field.dart';
import 'package:business_banking/features/test_feature/lib/features/login/ui/text_regular.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginUIScreen extends Screen {
  LoginUIScreen();

  final EdgeInsetsGeometry paddingAroundTextField = const EdgeInsets.only(
    bottom: 4.0,
    top: 11.0,
  );
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(0xFF, 0x1B, 0x56, 0x31),
      body: Stack(children: [
        hexBackgroundImage(context),
        Center(
            child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 22.0, right: 22.0),
          child: buildLoginFormWithLogo(context),
        )),
      ]),
      bottomSheet: footerWidget(context),
    );
  }

  Widget hexBackgroundImage(BuildContext context) {
    double leftPosition = 0;
    double rightPosition = 0;
    double bottomPosition = 0;
    double topPosition = 0;
    if (CheckDeviceConstraintsUtil().isLandScapeOrientation(context)) {
      rightPosition =
          CheckDeviceConstraintsUtil().getDeviceWidth(context) > 1194
              ? CheckDeviceConstraintsUtil().getDeviceHeight(context) / 3.8
              : CheckDeviceConstraintsUtil().getDeviceWidth(context) / 4.3;
      rightPosition = rightPosition;
      bottomPosition = 0;
      topPosition = -135;
    } else {
      if (CheckDeviceConstraintsUtil().isMobileDevice(context)) {
        leftPosition = -150;
        rightPosition = -200;
        bottomPosition = -350;
        topPosition = -450;
        // left: -100,
        // right: -200,
        // bottom: -350,
        // top: -450,
      } else {
        rightPosition = 30;
        leftPosition = -10;
        bottomPosition = 0;
        topPosition =
            -CheckDeviceConstraintsUtil().getDeviceWidth(context) / 3.8;
      }
    }

    return Positioned(
        left: leftPosition,
        right: rightPosition,
        bottom: bottomPosition,
        top: topPosition,
        child: Image.asset(
          "assets/images/login_hex_background.png",
          key: const Key('hex-background'),
          fit: BoxFit.cover,
        ));
  }

  Widget buildLoginFormWithLogo(BuildContext context) {
    if (CheckDeviceConstraintsUtil().isMobileDevice(context)) {
      return Column(children: [
        hnbLogoSvg(context),
        buildLoginFormWithLogoWidget(context),
      ]);
    } else {
      if (CheckDeviceConstraintsUtil().isLandScapeOrientation(context)) {
        return Row(children: [
          Flexible(
              flex: 3,
              child: Padding(
                  padding: const EdgeInsets.only(left: 100, bottom: 90),
                  child: hnbLogoSvg(context))),
          Flexible(
            flex: 6,
            child: Padding(
                padding: const EdgeInsets.only(left: 55, bottom: 100),
                child: SizedBox(
                    width: 330, child: buildLoginFormWithLogoWidget(context))),
          ),
        ]);
      } else {
        return Row(children: [
          Flexible(
            child: Padding(
                padding: EdgeInsets.only(
                    left: CheckDeviceConstraintsUtil().getDeviceWidth(context) /
                        9,
                    bottom: 100),
                child: hnbLogoSvg(context)),
          ),
          Flexible(
              child: SizedBox(
                  width: 320,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: buildLoginFormWithLogoWidget(context)))),
        ]);
      }
    }
  }

  Widget buildLoginFormWithLogoWidget(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            )),
        child: Container(
            padding: const EdgeInsets.only(left: 20.0, top: 14.0, right: 10),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  companyIDTextField(context),
                  userNameTextField(context),
                  passwordTextField(context),
                  forgetUserNameAndPasswordLink(),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 21.0, right: 8, bottom: 15),
                      child: loginSubmitButton(context)),
                ]))));
  }

  Widget hnbSvgAssetLogo(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/hnb_logo.svg',
      key: const Key('hnb-logo'),
      semanticsLabel: 'huntington logo icon',
      height: CheckDeviceConstraintsUtil().isMobileDevice(context) ? 35 : 60,
      width: 138.0,
    );
  }

  Widget hnbLogoSvg(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 5),
      child: Row(children: [
        if (CheckDeviceConstraintsUtil().isLandScapeOrientation(context))
          Flexible(child: hnbSvgAssetLogo(context))
        else
          hnbSvgAssetLogo(context),
      ]),
    );
  }

  double getBoxWidth(BuildContext context) {
    if (CheckDeviceConstraintsUtil().isLandScapeOrientation(context)) {
      return 250;
    } else {
      return CheckDeviceConstraintsUtil().isMobileDevice(context)
          ? CheckDeviceConstraintsUtil().getDeviceWidth(context) /
              (CheckDeviceConstraintsUtil().isIphone5s(context) ? 1.55 : 1.42)
          : 245;
    }
  }

  Widget companyIDTextField(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Flexible(
          child: SizedBox(
              width: getBoxWidth(context),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const TextRegularHNB(
                      text: 'Company ID',
                      paddingAroundTextField: EdgeInsets.only(bottom: 4),
                    ),
                    TextFieldHNB(
                      key: const Key('companyID-textField'),
                      fieldLabel: '',
                      onTextChanged: (value) {},
                      suffixIcon: clearIcon(),
                    )
                  ]))),
      saveCheckBox(),
    ]);
  }

  Widget clearIcon() {
    return IconButton(
      icon: const Icon(
        Icons.cancel_rounded,
        key: Key('clear-icon'),
        semanticLabel: 'Tap to clear text field',
      ),
      onPressed: () {},
      color: Colors.black54,
      alignment: Alignment.centerRight,
      iconSize: 20,
    );
  }

  Widget footerWidget(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.only(
                top: CheckDeviceConstraintsUtil().isIphone5s(context) ? 15 : 22,
                left: 22,
                right: 10,
                bottom: 18),
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (!CheckDeviceConstraintsUtil().isMobileDevice(context))
                    const SizedBox(
                      width: 120.0,
                    ),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Flexible(
                        child: SvgPicture.asset(
                      "assets/images/icon_call.svg",
                      semanticsLabel: 'contact us icon',
                      key: const Key('contact-us-svg'),
                      color: const Color.fromARGB(0xFF, 0x1B, 0x56, 0x31),
                    )),
                    const Flexible(
                        child: TextRegularHNB(
                      text: 'Contact Us',
                      paddingAroundTextField: EdgeInsets.only(top: 8, left: 5),
                    )),
                  ]),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Flexible(child: hnbSmallLogoWithWText(context)),
                ])));
  }

  Widget hnbSmallLogo() {
    return SvgPicture.asset(
      "assets/images/hnb_small_logo.svg",
      semanticsLabel: 'huntington logo icon',
      color: const Color.fromARGB(0xFF, 0x1B, 0x56, 0x31),
      height: 7,
      width: 7,
    );
  }

  Widget hnbSmallLogoWithWText(BuildContext context) {
    return SizedBox(
        width: !CheckDeviceConstraintsUtil().isMobileDevice(context)
            ? 350
            : CheckDeviceConstraintsUtil().isIphone5s(context)
                ? 170
                : 220,
        child: Row(
          children: [
            Expanded(
                child: Text.rich(
              TextSpan(children: <InlineSpan>[
                TextSpan(
                    text: "Member FDIC. ",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 7, color: Colors.black54)),
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: hnbSmallLogo(),
                  style: const TextStyle(decoration: TextDecoration.none),
                ),
                TextSpan(
                  text:
                      '® and Huntington® are federally registered service marks of Huntington Bancshares Incorporated. ©2019 Huntington Bancshares Incorporated. ',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 7, color: Colors.black54),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: LinkBigHNB(
                    text: "Privacy Policy.",
                    onTap: () {},
                    fontSize: 7,
                  ),
                ),
              ]),
              key: const Key('rich-text-footer'),
            )),
          ],
        ));
  }

  Widget saveCheckBox() {
    return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CheckBoxHNB(
          content: 'Save',
          onTap: () {},
        ));
  }

  Widget userNameTextField(BuildContext context) {
    return Row(children: <Widget>[
      SizedBox(
          width: getBoxWidth(context),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextRegularHNB(
              text: 'Username',
              paddingAroundTextField: paddingAroundTextField,
            ),
            TextFieldHNB(
              key: const Key('username-textField'),
              fieldLabel: '',
              onTextChanged: (value) {},
              suffixIcon: clearIcon(),
            ),
          ]))
    ]);
  }

  Widget passwordTextField(BuildContext context) {
    return Row(children: <Widget>[
      SizedBox(
        width: getBoxWidth(context),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextRegularHNB(
            text: 'Password',
            paddingAroundTextField: paddingAroundTextField,
          ),
          TextFieldHNB(
            key: const Key('password-textField'),
            fieldLabel: '',
            onTextChanged: (value) {},
            suffixIcon: clearIcon(),
          ),
        ]),
      )
    ]);
  }

  Widget forgetUserNameAndPasswordLink() {
    return Row(children: [
      Flexible(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
            TextRegularHNB(
              text: 'Forgot Username or Password',
              paddingAroundTextField: EdgeInsets.only(top: 10.0, left: 10),
              decoration: TextDecoration.underline,
            )
          ])),
    ]);
  }

  Widget loginSubmitButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
            child: PrimaryButtonHNB(
          buttonText: 'Log In',
          disableWhenClicked: true,
          onTap: () {},
        )),
      ],
    );
  }
}
