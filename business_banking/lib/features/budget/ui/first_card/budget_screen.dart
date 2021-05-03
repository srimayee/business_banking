import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/ui/budget_feature_actions.dart';
import 'package:business_banking/features/budget/ui/widgets/account_row_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends Screen {
  final BudgetViewModel viewModel;
  final BudgetFeatureActions actions;

  BudgetScreen({required this.viewModel, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: ListView.builder(
          key: Key('budgetAccountListItemView'),
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          shrinkWrap: true,
          itemCount: viewModel.accounts.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: AccountRowWidget(
                viewModel: viewModel,
                actions: actions,
                rowIndex: index,
              ),
            );
          },
        ),
      ),
    );
  }
}
