
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_form_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SideCashEnrollmentFormFeatureWidget extends StatelessWidget {

  final SideCashEnrollmentBloc bloc;

  const SideCashEnrollmentFormFeatureWidget({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SideCashEnrollmentBloc>(
      create: (_)=>  bloc ?? SideCashEnrollmentBloc(),
      child: SideCashEnrollmentFormPresenter(),
    );
  }
}
