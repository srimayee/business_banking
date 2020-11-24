import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/customer/model/customer_view_model.dart';
import 'package:business_banking/features/customer/bloc/customer_bloc.dart';
import 'customer_screen.dart';
import 'customer_detail_widget.dart';

class CustomerPresenter extends Presenter<CustomerBloc, CustomerViewModel, CustomerScreen> {
  @override
  Stream<CustomerViewModel> getViewModelStream(CustomerBloc bloc) {
    // return Stream<CustomerViewModel>.value(CustomerViewModel());
    return bloc.customerViewModelPipe.receive;
  }

  @override
  CustomerScreen buildScreen(BuildContext context, CustomerBloc bloc,
      CustomerViewModel viewModel) {
    return CustomerScreen(
      viewModel: viewModel,
      navigateToCustomerDetail: () {
        _navigateToCustomerDetail(context);
      },
    );
  }

  void _navigateToCustomerDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: 'CustomerDetail'),
        builder: (context) => CustomerDetailWidget(),
      ),
    );
  }
}
