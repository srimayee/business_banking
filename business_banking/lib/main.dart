import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/login/ui/login_feature_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'locator.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  logger().setLogLevel(LogLevel.verbose);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.green,
      statusBarColor: Colors.green
    )
  );

  runApp(
    MaterialApp(
      navigatorKey: navigatorKey,
      // home: LoginFeatureWidget(),
      home: HubScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
