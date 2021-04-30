import 'package:business_banking/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'credit_card_presenter.dart';

class CreditCardWidget extends StatelessWidget {
  final bool debugEnabled = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreditCardBloc>(
      create: (_) => CreditCardBloc(),
      child: CreditCardPresenter(),
    );
  }
}
