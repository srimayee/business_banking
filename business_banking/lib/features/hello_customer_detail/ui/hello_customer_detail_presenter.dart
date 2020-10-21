import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_customer_detail/model/hello_customer_detail_view_model.dart';
import 'package:business_banking/features/hello_customer_detail/bloc/hello_customer_detail_bloc.dart';
import 'hello_customer_detail_screen.dart';

class HelloCustomerDetailPresenter extends Presenter<HelloCustomerDetailBloc, HelloCustomerDetailViewModel, HelloCustomerDetailScreen> {
  @override
  Stream<HelloCustomerDetailViewModel> getViewModelStream(HelloCustomerDetailBloc bloc) {
    return bloc.helloCustomerDetailViewModelPipe.receive;
  }

  @override
  HelloCustomerDetailScreen buildScreen(BuildContext context, HelloCustomerDetailBloc bloc,
      HelloCustomerDetailViewModel viewModel) {
    return HelloCustomerDetailScreen(
      viewModel: viewModel,
    );
  }
}
