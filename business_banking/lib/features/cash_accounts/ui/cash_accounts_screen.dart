import 'dart:ui';

import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashAccountsScreen extends Screen {
  final CashAccountsListViewModel viewModel;
  final VoidCallback navigateToAccountDetail;

  CashAccountsScreen(
      {@required this.viewModel, @required this.navigateToAccountDetail})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: AccountCard(
            viewModel: viewModel,
            key: Key('accountCard1'),
          ),
          onTap: () {
            navigateToAccountDetail();
          },
        )
      ],
    );
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final CashAccountsListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    /// Locale Currency Conversion
    /// ToDo() make this a global reference somewhere
    var _usdCurrency = new NumberFormat("#,##0.00", "en_US");

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.cashAccountEntityModel.length,
        itemBuilder: (BuildContext context, int index) {
          final currentCashAccountViewModel =
              viewModel.cashAccountEntityModel[index];
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
            child: Card(
              color: Colors.white,
              shadowColor: Colors.grey[500],
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(currentCashAccountViewModel.accountTitle,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis),
                        Text("..." + currentCashAccountViewModel.accountNumber,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Account Balance:',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                            overflow: TextOverflow.ellipsis),
                        Text(
                            "\$" +
                                _usdCurrency.format(
                                    currentCashAccountViewModel.accountBalance),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                            key: Key('accountBalance'))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Account Type:',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                            overflow: TextOverflow.ellipsis),
                        Text("Cash",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                            key: Key('accountType'))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Account Status:',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                            overflow: TextOverflow.ellipsis),
                        Text(currentCashAccountViewModel.accountStatus,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                            key: Key('accountStatus'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
