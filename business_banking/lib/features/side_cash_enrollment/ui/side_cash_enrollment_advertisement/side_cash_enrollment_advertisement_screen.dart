import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SideCashEnrollmentAdvertisementScreen extends Screen {

 final Function() enrollTapped;
 final String message;

  SideCashEnrollmentAdvertisementScreen({@required this.enrollTapped, @required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text(message ?? "no message passed"),
          onPressed: () {
            enrollTapped();
          },
        ),
      ),
    );
  }
}
