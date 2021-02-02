import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_keys.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SideCashEnrollmentCompletionScreen extends Screen {
  final Function(BuildContext) exitFeature;

  final EnrollmentCompletionViewModel viewModel;

  SideCashEnrollmentCompletionScreen({
    @required this.viewModel,
    @required this.exitFeature,
  }) : assert(
          viewModel != null && exitFeature != null
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("completion Screen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Message: ${viewModel.message}"),
          Text("was successful: ${viewModel.isSuccess}"),
          RaisedButton(
            child: Text("Nice!"),
            onPressed: () =>  exitFeature(context),
          ),
        ],
      )),
    );
  }
}
