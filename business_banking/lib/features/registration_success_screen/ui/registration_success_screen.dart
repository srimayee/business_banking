import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends Screen {
  SuccessScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Business Banking',
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(child: Text('Successfully Registered')),
    );
  }
}
