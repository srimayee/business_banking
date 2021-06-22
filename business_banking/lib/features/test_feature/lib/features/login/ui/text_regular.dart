import 'package:flutter/material.dart';

class TextRegularHNB extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry? paddingAroundTextField;
  final TextDecoration? decoration;
  final FontWeight? fontWeightOfText;
  final TextStyle? style;

  const TextRegularHNB({
    Key? key,
    required this.text,
    this.textAlign,
    this.decoration,
    this.overflow,
    this.paddingAroundTextField = const EdgeInsets.all(0),
    this.fontWeightOfText = FontWeight.w600,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingAroundTextField!,
      child: Text(text,
          textAlign: textAlign,
          overflow: overflow,
          style: style ??
              Theme.of(context).textTheme.caption!.copyWith(
                    letterSpacing: 0,
                    fontSize: 12,
                    fontWeight: fontWeightOfText,
                    decoration: decoration,
                  )),
    );
  }
}
