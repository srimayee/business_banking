import 'package:flutter/material.dart';
import 'package:mbusinessonline/features/login/ui/screens/login_ui_screen.dart';

const String initialRoute = "/";

class RouteGenerator {
  static Route<dynamic> genrateRoute(RouteSettings settings) {
    Widget screen;
    // Use setting.arguments with Navigator.pushNamed(DetailsScreen.routeName,arguments:"accountid-XXX") to pass data between screens
    // this is to be used for non application state data like a user selecting an account and navigating to the
    // details screen. The details screen needs to know what account was selected
    // final args = settings.arguments; if (args is String){ MaterialPageRoute(builder: (_) => DetailsScreen(data:args))}
    switch (settings.name) {
      case initialRoute:
      case LoginUiScreen.routeName:
        screen = LoginUiScreen();
        break;
      default:
        screen = LoginUiScreen();
    }
    return MaterialPageRoute(builder: (_) => screen);
  }
}
