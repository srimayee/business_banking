import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';

class FieldLabelHNB extends StatelessWidget {
  final String text;

  const FieldLabelHNB({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            TextStyleHNB(context, type: TextStyleType.accentSmallBold).style);
  }
}
