import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/src/ui/themes/colors_hnb.dart';

enum TextStyleType {
  accentAmount,
  primaryAmount,
  primaryTextHeadline,
  accentTextHeadline,
  accentSubTitle,
  accentBoldBody,
  primaryVariantBoldBody,
  accentUnderlineBody,
  accentBody,
  errorBody,
  accentSmallBold,
  primaryVariantSmallBold,
  errorSmallBold,
  accentSmallUnderline,
  accentSmallBody,
  accentThinHeadline,
  accentFootNote,
  foregroundBoldBody,
  accentFootNoteUnderline
}

@immutable
class TextStyleHNB extends TextStyle {
  final BuildContext context;
  final TextStyleType type;

  const TextStyleHNB(this.context, {required this.type});

  TextStyle? get style {
    switch (type) {
      case TextStyleType.accentAmount:
        return Theme.of(context).accentTextTheme.headline5;
      case TextStyleType.primaryAmount:
        return Theme.of(context).textTheme.headline3;
      case TextStyleType.primaryTextHeadline:
        return Theme.of(context).primaryTextTheme.headline2;
      case TextStyleType.accentTextHeadline:
        return Theme.of(context)
            .primaryTextTheme
            .headline2!
            .copyWith(color: accent);
      case TextStyleType.accentSubTitle:
        return Theme.of(context).accentTextTheme.subtitle1;
      case TextStyleType.accentBoldBody:
        return Theme.of(context).accentTextTheme.bodyText1;
      case TextStyleType.primaryVariantBoldBody:
        return Theme.of(context).textTheme.bodyText1;
      case TextStyleType.accentUnderlineBody:
        return Theme.of(context)
            .accentTextTheme
            .bodyText1!
            .copyWith(decoration: TextDecoration.underline);
      case TextStyleType.accentBody:
        return Theme.of(context).accentTextTheme.bodyText2;
      case TextStyleType.errorBody:
        return Theme.of(context)
            .accentTextTheme
            .bodyText2!
            .copyWith(color: error);
      case TextStyleType.accentSmallBold:
        return Theme.of(context).accentTextTheme.headline6;
      case TextStyleType.primaryVariantSmallBold:
        return Theme.of(context).textTheme.headline6;
      case TextStyleType.errorSmallBold:
        return Theme.of(context).textTheme.headline6!.copyWith(color: error);
      case TextStyleType.accentSmallUnderline:
        return Theme.of(context)
            .accentTextTheme
            .headline6!
            .copyWith(decoration: TextDecoration.underline);
      case TextStyleType.accentSmallBody:
        return Theme.of(context)
            .accentTextTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.normal);
      case TextStyleType.accentThinHeadline:
        return Theme.of(context).accentTextTheme.headline4;
      case TextStyleType.accentFootNote:
        return Theme.of(context).accentTextTheme.subtitle2;
      case TextStyleType.foregroundBoldBody:
        return Theme.of(context)
            .accentTextTheme
            .bodyText1!
            .copyWith(color: foreground);
      case TextStyleType.accentFootNoteUnderline:
        return Theme.of(context)
            .accentTextTheme
            .subtitle2!
            .copyWith(decoration: TextDecoration.underline);
      default:
        return null;
    }
  }
}
