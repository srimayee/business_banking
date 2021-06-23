import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkBigHNB extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String? openUrl;
  final TextStyle? style;

  const LinkBigHNB(
      {Key? key, required this.text, this.onTap, this.openUrl, this.style})
      : super(key: key);

  Future _launch() async {
    if (await canLaunch(openUrl!)) {
      await launch(openUrl!);
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(onTap != null || openUrl != null);
    return Semantics(
      value: "link",
      child: GestureDetector(
        onTap: onTap ?? _launch,
        child: Text(
          text,
          style: style ??
              TextStyleHNB(context, type: TextStyleType.accentFootNote).style,
        ),
      ),
    );
  }
}
