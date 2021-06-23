import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';

class ContactUsWithIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          ShowImageHNB(
            "packages/hnb_flutter_ui/assets/images/icon_call.svg",
            semanticsLabel: 'contact us icon',
            key: Key('contact-us-svg'),
            color: primaryVariant,
          ),
          HorizontalSpacerHNB(),
          TextRegularHNB(
            text: 'Contact Us',
          ),
        ],
      ),
    );
  }
}
