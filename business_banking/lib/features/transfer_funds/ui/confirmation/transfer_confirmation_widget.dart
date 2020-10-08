import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransferFundsConfirmationWidget extends StatelessWidget {
  final TransferFundsBloc _bloc;

  TransferFundsConfirmationWidget(this._bloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: TransferFundsConfirmationPresenter(),
    );
  }
}