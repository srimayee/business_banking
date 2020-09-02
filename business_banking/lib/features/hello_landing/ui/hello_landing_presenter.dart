import 'dart:async';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/model/hello_landing_view_model.dart';
import 'package:business_banking/features/hello_landing/bloc/hello_landing_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'hello_landing_screen.dart';

class HelloLandingPresenter extends Presenter<HelloLandingBloc, HelloLandingViewModel, HelloLandingScreen> {
  @override
  Stream<HelloLandingViewModel> getViewModelStream(HelloLandingBloc bloc) {
    return bloc.helloLandingViewModelPipe.receive;
  }
  
  @override
  HelloLandingScreen buildScreen(BuildContext context, HelloLandingBloc bloc, HelloLandingViewModel viewModel) {
    return HelloLandingScreen(
      viewModel: viewModel,
    );
  }
}