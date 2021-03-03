import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/customer/model/customer_view_model.dart';
import 'package:business_banking/features/customer/bloc/customer_bloc.dart';
import 'customer_screen.dart';
import 'package:business_banking/routes.dart';

class CustomerPresenter
    extends Presenter<CustomerBloc, CustomerViewModel, CustomerScreen> {
  @override
  Stream<CustomerViewModel> getViewModelStream(CustomerBloc bloc) {
    return bloc.customerViewModelPipe.receive;
  }

  @override
  CustomerScreen buildScreen(
      BuildContext context, CustomerBloc bloc, CustomerViewModel viewModel) {
    return CustomerScreen(
      viewModel: viewModel,
      navigateToCustomerDetail: () {
        _navigateToCustomerDetail(context);
      },
    );
  }

  void _navigateToCustomerDetail(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.customerDetailRoute);
  }
}
