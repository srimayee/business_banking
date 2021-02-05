import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/side_cash_enrollment_keys.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SideCashEnrollmentAdvertisementScreen extends Screen {
  final Function(BuildContext) enrollTapped;
  final String message;

  SideCashEnrollmentAdvertisementScreen(
      {@required this.enrollTapped, @required this.message}): assert(enrollTapped != null && message != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  message ?? "no message passed",
                  key: SideCashEnrollmentWidgetKeys
                      .sideCashEnrollAdvertisementHeader,
                  style: TextStyle(color: Colors.lightGreen, fontSize: 30.0),
                ),
              ),
              OutlineButton(
                key: SideCashEnrollmentWidgetKeys.sideCashEnrollButton,
                onPressed: () => enrollTapped(context),
                borderSide: BorderSide(
                  color: Colors.black54, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
                child: Text(
                  'Enroll',
                  style: TextStyle(color: Colors.black54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
