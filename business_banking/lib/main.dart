import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/ui/hello_landing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'example_locator.dart';

void main() {
  logger().setLogLevel(LogLevel.verbose);

  runApp(
    MaterialApp(
      home: HelloLandingWidget(),
    ),
  );
}