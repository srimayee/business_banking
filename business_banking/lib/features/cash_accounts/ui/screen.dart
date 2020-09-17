import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/cash_accounts/model/view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashAccountsScreen extends Screen {
  final CashAccountsViewModel viewModel;
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

  final CashAccountsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    /// Locale Currency Conversion
    /// ToDo() make this a global reference somewhere
    var _usdCurrency = new NumberFormat("#,##0.00", "en_US");

    return Container(
      height: 160,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        viewModel.accountTitle,
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AutoSizeText(
                      ' ...' + viewModel.accountNumber.toString(),
                      style: TextStyle(
                        fontSize: 23.0,
                      ),
                    ),
                  ],
                ),
              ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Account Balance:",
                        style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      ),
                      Text(
                        "\$" + _usdCurrency.format(viewModel.accountBalance),
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
                        key: Key('accountBalance'),
                      )
                    ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account Type:",
                      style: TextStyle(color: Colors.black54, fontSize: 14.0),
                    ),
                    Text(
                      viewModel.accountType,
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                      key: Key('accountType'),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account Status:",
                      style: TextStyle(color: Colors.black54, fontSize: 14.0),
                    ),
                    Text(
                      viewModel.accountStatus,
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                      key: Key('accountStatus'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}