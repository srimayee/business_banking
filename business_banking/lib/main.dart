import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'example_locator.dart';

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
      home: CashAccountsWidget(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
