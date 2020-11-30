import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/customer/bloc/customer_bloc.dart';
import 'customer_detail_presenter.dart';

class CustomerDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<CustomerBloc>(
      create: (_) => CustomerBloc(),
      child: CustomerDetailPresenter(),
    );
  }
}
