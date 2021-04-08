import 'package:business_banking/features/transaction/enums.dart';
import 'package:business_banking/features/transaction/model/transaction_details_model.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final TransactionDetailsModel viewModel;
  const TransactionTile({Key key, @required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionCategory category = EnumToString.fromString(
        TransactionCategory.values, viewModel.transactionCategory);
    return Container(
        child: ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Container(
            color: category.color,
            height: 30,
            width: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
          Text(viewModel.transactionTitle),
        ],
      ),
      trailing: Text('\$' + viewModel.transactionAmount),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(EnumToString.convertToString(category, camelCase: true)),
      ),
    ));
  }
}
