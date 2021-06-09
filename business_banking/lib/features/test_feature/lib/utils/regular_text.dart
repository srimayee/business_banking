import 'package:flutter/material.dart';

Widget textRegular(
  String text, {
  Color? color,
  double? size,
  TextAlign? textAlign,
  TextOverflow? overflow,
  int? maxLines,
  FontStyle? fontStyle,
  FontWeight fontWeight = FontWeight.w400,
  TextStyle? style,
  EdgeInsets? paddingAroundButton,
}) {
  return Padding(
      padding: paddingAroundButton ?? EdgeInsets.all(0),
      child: Text(
        text,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: style ??
            TextStyle(
              color: color ?? Colors.blue,
              fontSize: size ?? null,
              fontFamily: "Arial",
              fontWeight: fontWeight,
              fontStyle: fontStyle ?? null,
              inherit: true,
            ),
      ));
}
