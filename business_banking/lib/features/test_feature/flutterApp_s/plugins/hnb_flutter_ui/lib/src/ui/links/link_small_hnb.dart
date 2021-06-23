import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkSmallHNB extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String? openUrl;

  const LinkSmallHNB({Key? key, required this.text, this.onTap, this.openUrl})
      : super(key: key);

  Future _launch() async {
    if (await canLaunch(openUrl!)) {
      await launch(openUrl!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      value: "link",
      child: GestureDetector(
        onTap: onTap ?? _launch,
        child: Text(
          text,
          style: TextStyleHNB(context, type: TextStyleType.accentSmallUnderline)
              .style,
        ),
      ),
    );
  }
}
