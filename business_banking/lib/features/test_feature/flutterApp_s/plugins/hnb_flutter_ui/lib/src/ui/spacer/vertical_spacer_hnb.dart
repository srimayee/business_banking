import 'package:flutter/material.dart';

class VerticalSpacerHNB extends StatelessWidget {
  final double height;
  final double width;

  const VerticalSpacerHNB({Key? key, this.height = 10.0, this.width = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
