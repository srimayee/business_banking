import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:flutter/material.dart';

class FromAccountsDropDown extends StatelessWidget {
  final TransferFundsViewModel viewModel;
  final Function onChangeSelectedFromAccount;
  final Key key;

  FromAccountsDropDown({this.key, this.viewModel, this.onChangeSelectedFromAccount});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> _fromMenuItems = buildDropdownMenuItems(viewModel.fromAccounts);
    return DropdownButton<String>(
      key: key,
      isExpanded: true,
      items: _fromMenuItems,
      onChanged: (String value) {
        onChangeSelectedFromAccount(value);
      },
      hint: Text('Select a From Account'),
      value: viewModel.fromAccount,
    );
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(List accounts) {
    List<DropdownMenuItem<String>> items = List();
    int itemIndex = 0;
    for (String account in accounts) {
      itemIndex++;
      items.add(
        DropdownMenuItem(
          value: account,
          child: Text(account, key: Key('account_from_$itemIndex')),
        ),
      );
    }
    return items;
  }
}