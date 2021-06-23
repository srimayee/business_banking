import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';
import 'package:mbusinessonline/config/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/utils/responsive_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(CommercialMobileApp());
  });
}

class CommercialMobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeHNB.getLightTheme(context),
      initialRoute: initialRoute,
      onGenerateRoute: RouteGenerator.genrateRoute,
      builder: (context, widget) {
        return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            maxWidth: 1200,
            maxWidthLandscape: 1366,
            defaultScale: true,
            defaultScaleLandscape: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.resize(600, name: TABLET),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1025, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            breakpointsLandscape: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.resize(600, name: TABLET),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1024, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            landscapePlatforms: [
              ResponsiveTargetPlatform.iOS,
              ResponsiveTargetPlatform.android,
              ResponsiveTargetPlatform.web
            ]);
      },
    );
  }
}
