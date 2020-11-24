import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_detail_view_model.dart';
import 'package:business_banking/features/hello_customer/bloc/hello_customer_bloc.dart';
import 'hello_customer_detail_screen.dart';

class HelloCustomerDetailPresenter extends Presenter<HelloCustomerBloc, HelloCustomerDetailViewModel, HelloCustomerDetailScreen> {
  @override
  Stream<HelloCustomerDetailViewModel> getViewModelStream(HelloCustomerBloc bloc) {
    return bloc.helloCustomerDetailViewModelPipe.receive;
  }

  @override
  HelloCustomerDetailScreen buildScreen(BuildContext context, HelloCustomerBloc bloc,
      HelloCustomerDetailViewModel viewModel) {
    return HelloCustomerDetailScreen(
      viewModel: viewModel,
    );
  }
}
