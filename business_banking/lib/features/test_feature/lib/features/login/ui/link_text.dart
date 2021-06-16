import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkBigHNB extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String? openUrl;
  final double? fontSize;

  const LinkBigHNB(
      {Key? key, required this.text, this.onTap, this.openUrl, this.fontSize})
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
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              decoration: TextDecoration.underline, fontSize: fontSize),
        ),
      ),
    );
  }
}
