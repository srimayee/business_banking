import 'package:flutter/material.dart';

class HorizontalSpacerHNB extends StatelessWidget {
  final double height;
  final double width;

  const HorizontalSpacerHNB({Key? key, this.width = 10.0, this.height = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
