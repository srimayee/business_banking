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


  final Function() navigateToEnrollmentForm;

  _navigateToEnrollmentForm(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => SideCashEnrollmentFormFeatureWidget()));
  }

  SideCashEnrollmentAdvertisementPresenter({this.navigateToEnrollmentForm}) {
    print("in presenter constructor");
  }

  @override
  Stream<EnrollmentAdvertisementViewModel> getViewModelStream(
      SideCashEnrollmentBloc bloc) {
    print("trying to call getViewModelStream");
    // // TODO: implement getViewModelStream
    // throw UnimplementedError();
    return bloc.enrollmentAdvertisementPipe.receive;
  }

  @override
  SideCashEnrollmentAdvertisementScreen buildScreen(BuildContext context,
      SideCashEnrollmentBloc bloc, EnrollmentAdvertisementViewModel viewModel) {
    print("In side cash enrollment advertisement screen");
    return SideCashEnrollmentAdvertisementScreen(
        message: viewModel.message,
        enrollTapped: (ctx) =>
        navigateToEnrollmentForm ?? _navigateToEnrollmentForm(ctx)
    );
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
    // TODO: implement buildLoadingScreen
    return super.buildLoadingScreen(context);
  }
}
