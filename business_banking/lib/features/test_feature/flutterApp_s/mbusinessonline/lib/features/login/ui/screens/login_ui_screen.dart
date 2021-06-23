import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';
import 'package:mbusinessonline/features/login/ui/widgets/footer_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginUiScreen extends Screen {
  static const routeName = "/login";
  LoginUiScreen();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScrollableStackHNB(
      backGroundColor: commercialGreen,
      stackChildren: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: OverflowBox(
            alignment: ResponsiveWrapper.of(context).isLargerThan(MOBILE)
                ? ResponsiveWrapper.of(context).orientation ==
                        Orientation.portrait
                    ? const Alignment(-1, -0.28)
                    : const Alignment(-1, -0.01)
                : const Alignment(-0.17, -0.23),
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            child: const ShowImageHNB(
              "packages/hnb_flutter_ui/assets/images/login_hex_background.svg",
              key: Key('hex-background'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: ResponsiveWrapper.of(context).isLargerThan(MOBILE)
              ? const Alignment(0.2, -0.24)
              : const Alignment(0.1, -0.25),
          child: Wrap(
            spacing: 20,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const FractionallySizedBox(
                widthFactor: 0.25,
                child: ShowImageHNB(
                  'packages/hnb_flutter_ui/assets/images/hnb_logo.svg',
                  key: Key('hnb-logo-with-text'),
                  semanticsLabel: 'huntington logo icon',
                ),
              ),
              buildLoginUiWithLogoWidget(context)
            ],
          ),
        ),
        FooterWidget(),
      ],
    );
  }

  Widget buildLoginUiWithLogoWidget(BuildContext context) {
    return FractionallySizedBox(
      widthFactor:
          ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? 0.5 : 0.8,
      child: Container(
        decoration: const BoxDecoration(
          color: foreground,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFieldHNB(
                        paddingAroundTextField:
                            const EdgeInsets.only(bottom: 4),
                        key: const Key('companyID-textField'),
                        fieldLabel: 'Company ID',
                        onTextChanged: (value) {},
                        textFieldMaxWidth: constraints.maxWidth - 40,
                        suffixIcon: ClearIconHNB(
                            onTapAction: () {},
                            semanticLabelForAction: 'Tap to clear text field'),
                      ),
                      const HorizontalSpacerHNB(),
                      CheckBoxHNB(
                          key: const Key('Save-checkBox'),
                          content: 'Save',
                          onTap: () {}),
                    ],
                  ),
                  const VerticalSpacerHNB(),
                  TextFieldHNB(
                    key: const Key('username-textField'),
                    fieldLabel: 'Username',
                    onTextChanged: (value) {},
                    textFieldMaxWidth: constraints.maxWidth - 40,
                    suffixIcon: ClearIconHNB(
                      onTapAction: () {},
                      semanticLabelForAction: 'Tap to clear text field',
                    ),
                  ),
                  const VerticalSpacerHNB(),
                  TextFieldHNB(
                    key: const Key('password-textField'),
                    fieldLabel: 'password',
                    onTextChanged: (value) {},
                    textFieldMaxWidth: constraints.maxWidth - 40,
                    suffixIcon: ClearIconHNB(
                      onTapAction: () {},
                      semanticLabelForAction: 'Tap to clear text field',
                    ),
                  ),
                  const VerticalSpacerHNB(),
                  Row(children: [
                    Flexible(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                          LinkSmallHNB(
                            text: 'forger username and password',
                            key: Key('forget-username-password-link'),
                          ),
                        ])),
                  ]),
                  const VerticalSpacerHNB(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                          child: PrimaryButtonHNB(
                        key: const Key('Log In'),
                        buttonText: 'Login',
                        disableWhenClicked: true,
                        onTap: () {},
                      )),
                    ],
                  ),
                  const VerticalSpacerHNB(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
