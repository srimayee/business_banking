import 'package:business_banking/features/transaction_detail/model/transaction_details_model.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final TransactionDetailsModel viewModel;
  const TransactionTile({Key key, @required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      title: Text(viewModel.transactionTitle),
    ));
  }
}
