import 'package:business_banking/features/card_usage/bloc/card_summary_bloc.dart';
import 'package:business_banking/features/card_usage/ui/card_summary_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CardTransactionWidget extends StatelessWidget {
  final bool debugEnabled = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardSummaryBloc>(
      create: (_) => CardSummaryBloc(),
      child: CardSummaryPresenter(),
    );
  }
}
