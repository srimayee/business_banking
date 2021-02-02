import 'dart:async';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_advertisement/side_cash_enrollment_advertisement_screen.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_form/side_cash_enrollment_form_feature_widget.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/customer/model/customer_view_model.dart';
import 'package:business_banking/features/customer/bloc/customer_bloc.dart';

class SideCashEnrollmentAdvertisementPresenter extends Presenter<
    SideCashEnrollmentBloc,
    EnrollmentAdvertisementViewModel,
    SideCashEnrollmentAdvertisementScreen> {
  final Function(BuildContext) testNavigateToEnrollmentForm;

  _navigateToEnrollmentForm(BuildContext context, SideCashEnrollmentBloc bloc) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => SideCashEnrollmentFormFeatureWidget()));
  }

  SideCashEnrollmentAdvertisementPresenter({this.testNavigateToEnrollmentForm});

  @override
  Stream<EnrollmentAdvertisementViewModel> getViewModelStream(
      SideCashEnrollmentBloc bloc) {
    return bloc.enrollmentAdvertisementPipe.receive;
  }

  @override
  SideCashEnrollmentAdvertisementScreen buildScreen(BuildContext context,
      SideCashEnrollmentBloc bloc, EnrollmentAdvertisementViewModel viewModel) {
    return SideCashEnrollmentAdvertisementScreen(
        message: viewModel.message,
        enrollTapped: (ctx) {
          return testNavigateToEnrollmentForm ?? _navigateToEnrollmentForm(ctx, bloc);
        });
  }

  @override
  Widget buildErrorScreen(BuildContext context, Error error) {
    print("in build error screen");
    // TODO: implement buildErrorScreen
    return Container(
      child: Text("error: ${error.toString()}"),
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    print("in build loading screen");
    return Center(child:CircularProgressIndicator());
  }
}
