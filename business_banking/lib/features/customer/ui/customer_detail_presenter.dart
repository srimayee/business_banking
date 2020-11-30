import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/customer/model/customer_detail_view_model.dart';
import 'package:business_banking/features/customer/bloc/customer_bloc.dart';
import 'customer_detail_screen.dart';

class CustomerDetailPresenter extends Presenter<CustomerBloc, CustomerDetailViewModel, CustomerDetailScreen> {
  @override
  Stream<CustomerDetailViewModel> getViewModelStream(CustomerBloc bloc) {
    return bloc.customerDetailViewModelPipe.receive;
  }

  @override
  CustomerDetailScreen buildScreen(BuildContext context, CustomerBloc bloc,
      CustomerDetailViewModel viewModel) {
    return CustomerDetailScreen(
      viewModel: viewModel,
    );
  }
}
