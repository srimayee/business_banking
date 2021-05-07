import 'package:business_banking/features/online_registration/ui/online_registration_feature_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class HubScreen extends Screen {
  HubScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Business Banking',
          key: Key('CAappBarName'),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: OnlineRegistrationFeatureWidget(),
    );
  }
}
