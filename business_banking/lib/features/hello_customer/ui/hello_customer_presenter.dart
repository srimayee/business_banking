import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_view_model.dart';
import 'package:business_banking/features/hello_customer/bloc/hello_customer_bloc.dart';
import 'hello_customer_screen.dart';
import 'hello_customer_detail_widget.dart';

class HelloCustomerPresenter extends Presenter<HelloCustomerBloc, HelloCustomerViewModel, HelloCustomerScreen> {
  @override
  Stream<HelloCustomerViewModel> getViewModelStream(HelloCustomerBloc bloc) {
    // return Stream<HelloCustomerViewModel>.value(HelloCustomerViewModel());
    return bloc.helloCustomerViewModelPipe.receive;
  }

  @override
  HelloCustomerScreen buildScreen(BuildContext context, HelloCustomerBloc bloc,
      HelloCustomerViewModel viewModel) {
    return HelloCustomerScreen(
      viewModel: viewModel,
      navigateToHelloCustomerDetail: () {
        _navigateToHelloCustomerDetail(context);
      },
    );
  }

  void _navigateToHelloCustomerDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: 'HelloCustomerDetail'),
        builder: (context) => HelloCustomerDetailWidget(),
      ),
    );
  }
}
