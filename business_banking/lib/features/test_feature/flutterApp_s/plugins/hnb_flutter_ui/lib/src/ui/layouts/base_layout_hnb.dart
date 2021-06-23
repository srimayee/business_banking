import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';

class BaseLayoutHNB extends StatelessWidget {
  final Widget body;
  final AppBar? appbar;
  final Color? backGroundColor;
  const BaseLayoutHNB({
    Key? key,
    required this.body,
    this.appbar,
    this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGroundColor ?? foreground,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: backGroundColor ?? foreground,
          appBar: appbar,
          body: LayoutBuilder(
            builder: (context, viewportconstraints) => SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: viewportconstraints.minHeight,
                      minWidth: viewportconstraints.minWidth,
                      maxHeight: viewportconstraints.maxHeight,
                      maxWidth: viewportconstraints.maxWidth),
                  child: Container(child: body)),
            ),
          ),
        ),
      ),
    );
  }
}
