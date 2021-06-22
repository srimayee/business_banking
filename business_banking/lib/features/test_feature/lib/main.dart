import 'package:business_banking/features/test_feature/lib/features/login/ui/login_ui_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginUIScreen(),
      builder: (context, widget) {
        return ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 2460,
          minWidth: 320,
          minWidthLandscape: 906,
          maxWidthLandscape: 1366,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(320, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(601,
                name: 'SMALLTABLETS', scaleFactor: 0.8),
            const ResponsiveBreakpoint.autoScale(1000,
                name: 'LARGETABLETS', scaleFactor: 0.95),
            const ResponsiveBreakpoint.autoScale(1200,
                name: DESKTOP, scaleFactor: 1.15),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        );
      },
    );
  }
}
