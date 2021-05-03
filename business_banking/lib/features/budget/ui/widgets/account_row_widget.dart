import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/ui/budget_feature_actions.dart';
import 'package:flutter/material.dart';

class AccountRowWidget extends StatelessWidget {
  final BudgetViewModel viewModel;
  final BudgetFeatureActions actions;
  final rowIndex;

  AccountRowWidget(
      {required this.viewModel, required this.actions, this.rowIndex = 0});

  @override
  Widget build(BuildContext context) {
    final _nickname = viewModel.accounts[rowIndex].accountNickname;
    final _balance = viewModel.accounts[rowIndex].availableBalance;
    final _accountNumber = viewModel.accounts[rowIndex].accountNumber;
    final uniqueKey = 'pie' + '$rowIndex';
    return InkWell(
      key: Key(uniqueKey),
      onTap: () => actions.pushViewChart(context, rowIndex),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _nickname,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  _balance.toString(),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Account Number:$_accountNumber',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                ),
                Divider(thickness: 1.0),
              ],
            ),
            Icon(
              Icons.pie_chart,
              semanticLabel: 'Pie Chart',
            ),
          ],
        ),
      ),
    );
  }
}
