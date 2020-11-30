import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/customer/bloc/customer_bloc.dart';
import 'customer_presenter.dart';

class CustomerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<CustomerBloc>(
      create: (_) => CustomerBloc(),
      child: CustomerPresenter(),
    );
  }
}
