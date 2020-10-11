import 'package:business_banking/features/transfer_funds/bloc/transfer_confirmation_bloc.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransferFundsConfirmationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransferConfirmationBloc(),
      child: TransferConfirmationPresenter(),
    );
  }
}