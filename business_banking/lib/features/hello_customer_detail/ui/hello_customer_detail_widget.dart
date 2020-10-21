import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_customer_detail/bloc/hello_customer_detail_bloc.dart';
import 'hello_customer_detail_presenter.dart';

class HelloCustomerDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<HelloCustomerDetailBloc>(
      create: (_) => HelloCustomerDetailBloc(),
      child: HelloCustomerDetailPresenter(),
    );
  }
}
