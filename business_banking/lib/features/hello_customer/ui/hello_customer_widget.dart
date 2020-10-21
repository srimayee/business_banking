import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_customer/bloc/hello_customer_bloc.dart';
import 'hello_customer_presenter.dart';

class HelloCustomerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<HelloCustomerBloc>(
      create: (_) => HelloCustomerBloc(),
      child: HelloCustomerPresenter(),
    );
  }
}
