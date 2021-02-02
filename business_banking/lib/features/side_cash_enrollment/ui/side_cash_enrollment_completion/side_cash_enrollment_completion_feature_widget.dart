import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:flutter/material.dart';

class SideCashEnrollmentCompletionFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enrollment Complete"),
      ),
      body: Center(
          child: Column(
        children: [
          Text("Complete/Failed"),
          RaisedButton(
              child: Text("Okay"),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => HubScreen()));
              })
        ],
      )),
    );
  }
}
