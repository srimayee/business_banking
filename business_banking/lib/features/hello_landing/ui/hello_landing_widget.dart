import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/bloc/hello_landing_bloc.dart';
import 'package:flutter/material.dart';

import 'hello_landing_presenter.dart';

class HelloLandingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HelloLandingBloc>(
      create: (_) => HelloLandingBloc(),
      child: HelloLandingPresenter(),
    );
  }
}