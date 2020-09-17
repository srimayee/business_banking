import 'package:business_banking/features/hub/bloc/hub_bloc.dart';
import 'package:business_banking/features/hub/ui/hub_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class HubFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HubBloc>(
      create: (_) => HubBloc(),
      child: HubPresenter(),
    );
  }
}
