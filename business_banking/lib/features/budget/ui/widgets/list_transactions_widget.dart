import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'package:business_banking/features/budget/ui/widgets/transactionI_tem_widget.dart';

class ListTransactionsWidget extends Screen {
  final BudgetViewModel viewModel;

  ListTransactionsWidget({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (viewModel.filteredTransactions != null) ? viewModel.filteredTransactions.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return TransactionItemWidget(
                  viewModel: viewModel, rowIndex: index);
            },
          ),
        ],
      ),
    );
  }
}
