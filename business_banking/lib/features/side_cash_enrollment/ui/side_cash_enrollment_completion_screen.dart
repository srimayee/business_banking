
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/side_cash_enrollment_keys.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SideCashEnrollmentCompletionScreen extends Screen {
  final Function(BuildContext) exitFeature;

  final EnrollmentCompletionViewModel viewModel;

  SideCashEnrollmentCompletionScreen({
    @required this.viewModel,
    @required this.exitFeature,
  }) : assert(viewModel != null && exitFeature != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: SideCashEnrollmentWidgetKeys.enrollmentCompletionScaffold,
      appBar: AppBar(
        title: Text(
          "completion Screen",
          key: SideCashEnrollmentWidgetKeys.enrollmentCompletionAppBarText,
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Message: ${viewModel.message}",
            key: SideCashEnrollmentWidgetKeys.completionMessage,
          ),
          Text(
            "was successful: ${viewModel.isSuccess}",
            key: SideCashEnrollmentWidgetKeys.successBooleanMessage,
          ),
          RaisedButton(
            key: SideCashEnrollmentWidgetKeys.exitEnrollmentFeatureButton,
            child: Text("Exit Feature!", key: Key("exitEnrollmentFeatureButtonText"),),
            onPressed: () => exitFeature(context),
          ),
        ],
      )),
    );
  }
}
