import 'package:business_banking/features/promos/bloc/promos_bloc.dart';
import 'package:business_banking/features/promos/ui/promos_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class PromosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PromosBloc(),
      child: PromoPresenter(),
    );
  }
}
