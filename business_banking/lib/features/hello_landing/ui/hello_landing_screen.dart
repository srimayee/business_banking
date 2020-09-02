import 'dart:ui';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/model/hello_landing_view_model.dart';
import 'package:flutter/material.dart';

class HelloLandingScreen extends Screen {
  final HelloLandingViewModel viewModel;
  
  HelloLandingScreen({
    @required this.viewModel
  }) : assert(() {
    return viewModel != null;
  } ());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello World!',
          style: TextStyle(
            fontSize: 40.0
          ),
        ),
      ),
    );
  }
}