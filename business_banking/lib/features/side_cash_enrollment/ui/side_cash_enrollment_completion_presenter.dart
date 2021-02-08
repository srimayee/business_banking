import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_completion_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class SideCashEnrollmentCompletionPresenter extends Presenter<
    SideCashEnrollmentBloc,
    EnrollmentCompletionViewModel,
    SideCashEnrollmentCompletionScreen> {
  final Function(BuildContext) testExitFeature;

  SideCashEnrollmentCompletionPresenter({this.testExitFeature});

  @override
  SideCashEnrollmentCompletionScreen buildScreen(
      BuildContext context, SideCashEnrollmentBloc bloc, ViewModel viewModel) {
    return SideCashEnrollmentCompletionScreen(
      viewModel: viewModel,
      exitFeature: exitFeature,
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }

  // TODO Untested
  exitFeature(BuildContext context) {
    print("in exitFeature");
   Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HubScreen()), (_) => false);
  }

  @override
  Stream<EnrollmentCompletionViewModel> getViewModelStream(
      SideCashEnrollmentBloc bloc) {
    return bloc.enrollmentCompletionPipe.receive;
  }

}

