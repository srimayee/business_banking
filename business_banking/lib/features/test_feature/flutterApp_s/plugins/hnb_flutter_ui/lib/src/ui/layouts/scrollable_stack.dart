import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';

class ScrollableStackHNB extends StatelessWidget {
  final Color backGroundColor;
  final List<Widget> stackChildren;
  final List<Widget>? footerButton;

  const ScrollableStackHNB({
    Key? key,
    required this.stackChildren,
    this.backGroundColor = foreground,
    this.footerButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayoutHNB(
      backGroundColor: backGroundColor,
      body: Stack(
        children: stackChildren,
      ),
    );
  }
}
