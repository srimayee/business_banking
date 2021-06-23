import 'package:flutter/material.dart';

class TextTinyHNB extends StatelessWidget {
  final String text;

  const TextTinyHNB({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 8),
      ),
    );
  }
}
