import 'dart:ui';

import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../locator.dart';

class CashAccountsScreen extends Screen {
  final CashAccountsViewModelList viewModel;
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
        AccountCard(
          viewModel: viewModel,
          navigateToAccountDetail: navigateToAccountDetail,
          key: Key('cashAccountsViewModel'),
        ),
      ],
    );
  }
}

class AccountCard extends StatelessWidget {
  final bool debugEnabled = false;

  const AccountCard(
      {Key key,
      @required this.viewModel,
      @required this.navigateToAccountDetail})
      : super(key: key);

  final CashAccountsViewModelList viewModel;
  final VoidCallback navigateToAccountDetail;

  @override
  Widget build(BuildContext context) {
    /// Locale Currency Conversion
    /// ToDo() make this a global reference somewhere
    var _usdCurrency = new NumberFormat("#,##0.00", "en_US");

    return ListView.builder(
      shrinkWrap: true,
      itemCount: viewModel.cashAccountEntityList.length,
      itemBuilder: (BuildContext context, int index) {
        final currentCashAccountViewModel =
            viewModel.cashAccountEntityList[index];

        if (debugEnabled) {
          logger().debug('Cash Accounts UI Data: ' +
              currentCashAccountViewModel.toString());
        }

        return Container(
          child: InkWell(
            onTap: () {
              navigateToAccountDetail();
            },
            child: Card(
              color: Colors.white,
              shadowColor: Colors.grey[500],
              elevation: 3.0,
              key: Key('cashAccountsCard' + (index.toInt() + 1).toString()),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(currentCashAccountViewModel.name,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis),
                        Text("..." + currentCashAccountViewModel.lastFour,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                            key: Key('cashAccountsCard' +
                                (index.toInt() + 1).toString() +
                                'AccountNumber'))
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
                                    currentCashAccountViewModel.balance),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                            key: Key('cashAccountsCard' +
                                (index.toInt() + 1).toString() +
                                'Balance'))
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
                            key: Key('cashAccountsCard' +
                                (index.toInt() + 1).toString() +
                                'AccountType'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
