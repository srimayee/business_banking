import 'package:business_banking/features/transaction_detail/bloc/transaction_details_bloc.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'transaction_detail_presenter.dart';

class TransactionDetailsWidget extends StatelessWidget {
  final bool debugEnabled = false;

  @override
  Widget build(BuildContext context) {
    if (debugEnabled) {
      logger().debug('Widget Built');
    }

    return BlocProvider<TransactionDetailsBloc>(
      create: (_) => TransactionDetailsBloc(),
      child: TransactionDetailPresenter(),
    );
  }
}
