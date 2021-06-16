import 'package:business_banking/features/test_feature/lib/utils/regular_text.dart';
import 'package:flutter/material.dart';

Widget buttonRegular(String text,
    {Color? color,
    double? size,
    double? width,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontStyle? fontStyle,
    FontWeight fontWeight = FontWeight.w400,
    TextStyle? style}) {
  return GestureDetector(
    onTap: () async {},
    child: Opacity(
      opacity: 0.80,
      child: Container(
        width: width ?? 100,
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: const Color(0xff2274f4)),
        child: textRegular(text,
            style: TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w400,
                fontFamily: "NotoSans",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.center),
      ),
    ),
  );
}
