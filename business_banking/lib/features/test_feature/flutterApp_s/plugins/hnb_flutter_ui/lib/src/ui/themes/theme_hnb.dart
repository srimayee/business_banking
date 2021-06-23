import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/src/ui/themes/colors_hnb.dart';

class ThemeHNB {
  static TextTheme _getCommonTextTheme() {
    return const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.w800,
        //letterSpacing: 0.15,
        fontSize: 12,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
      headline3: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 30,
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 20,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: 30,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.w700,
        //letterSpacing: 0.15,
        fontSize: 18,
      ),
      subtitle2: TextStyle(
        fontWeight: FontWeight.w400,
        //letterSpacing: 0.1,
        fontSize: 7,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.w700,
        //letterSpacing: 0.5,
        fontSize: 15,
      ),
      bodyText2: TextStyle(
        fontWeight: FontWeight.w400,
        //letterSpacing: 0.25,
        fontSize: 15,
      ),
      /*caption: TextStyle(
        fontWeight: FontWeight.w400,
        //letterSpacing: 0.4,
        fontSize: 12,
      ),*/
      button: TextStyle(
        fontWeight: FontWeight.w500,
        //letterSpacing: 1.25,
        fontSize: 16,
      ),
      /*overline: TextStyle(
        fontWeight: FontWeight.w400,
        //letterSpacing: 1.5,
        fontSize: 10,
      ),*/
    );
  }

  static ThemeData getLightTheme(BuildContext context) {
    return ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.standard,
        //primarySwatch: ,
        primaryColor: primary,
        primaryColorBrightness: Brightness.light,
        //primaryColorLight: ,
        primaryColorDark: primaryVariant,
        accentColor: accent,
        accentColorBrightness: Brightness.light,
        canvasColor: foreground,
        scaffoldBackgroundColor: foreground,
        //bottomAppBarColor: ,
        //cardColor: ,
        //dividerColor: ,
        //focusColor: ,
        //hoverColor: ,
        //highlightColor: ,
        //splashColor: ,
        //splashFactory: ,
        //selectedRowColor: ,
        //unselectedWidgetColor: ,
        //disabledColor: ,
        buttonColor: accent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return accent.withOpacity(0.5);
                } else if (states.contains(MaterialState.hovered)) {
                  return accent.withOpacity(0.5);
                }
                return accent;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
              (Set<MaterialState> states) {
                return Theme.of(context).textTheme.button;
              },
            ),
            shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
              (Set<MaterialState> states) {
                return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0));
              },
            ),
          ),
          // textTheme: ButtonTextTheme.primary,
          //shape:
          //  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          // buttonColor: charcoalGrayColor,
          // splashColor: lightGrayColor40,
        ),
        //toggleButtonsTheme: ,
        //secondaryHeaderColor: ,
        //textSelectionColor: ,
        //textSelectionTheme:const TextSelectionThemeData(cursorColor: charcoalGrayColor),
        //textSelectionHandleColor: ,
        //backgroundColor: lightGrayColor40,
        //dialogBackgroundColor: ,
        //indicatorColor: ,
        //hintColor: Colors.black26,
        //errorColor: ,
        //toggleableActiveColor: ,
        //fontFamily: ,
        textTheme: _getCommonTextTheme()
            .apply(
                fontFamily: "Muli",
                bodyColor: primaryVariant,
                displayColor: primary)
            .merge(
              const TextTheme(
                button: TextStyle(color: foreground),
              ),
            ),
        primaryTextTheme: _getCommonTextTheme()
            .apply(
                fontFamily: "HuntingtonApex",
                bodyColor: primary,
                displayColor: primary)
            .merge(
              const TextTheme(
                button: TextStyle(color: foreground),
              ),
            ),
        accentTextTheme: _getCommonTextTheme()
            .apply(fontFamily: "Muli", bodyColor: accent, displayColor: accent)
            .merge(
              const TextTheme(
                button: TextStyle(color: foreground),
              ),
            )
        //inputDecorationTheme:
        //iconTheme:
        //primaryIconTheme:
        //accentIconTheme:
        //sliderTheme:
        //tabBarTheme:
        //tooltipTheme:
        //cardTheme:
        //chipTheme:
        //platform:
        //materialTapTargetSize:
        //applyElevationOverlayColor:
        //pageTransitionsTheme:
        //appBarTheme:
        //bottomAppBarTheme:
        //colorScheme:
        //dialogTheme:
        //floatingActionButtonTheme:
        //typography:
        //cupertinoOverrideTheme:
        //snackBarTheme:
        //bottomSheetTheme:
        //popupMenuTheme:
        //bannerTheme:
        //dividerTheme:
        //buttonBarTheme:
        );
  }
}
