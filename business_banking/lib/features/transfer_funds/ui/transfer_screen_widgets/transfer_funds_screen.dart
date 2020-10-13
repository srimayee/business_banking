import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_screen_widgets/from_accounts_dropdown.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_screen_widgets/to_accounts_dropdown.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransferFundsScreen extends Screen {
  final TransferFundsViewModel viewModel;
  final Function onChangeSelectedFromAccount;
  final Function onChangeSelectedToAccount;
  final Function onChangeAmount;
  final Function onChangeDate;
  final VoidCallback onTapSubmit;

  TransferFundsScreen(
      {@required this.viewModel,
      @required this.onChangeSelectedFromAccount,
      @required this.onChangeSelectedToAccount,
      @required this.onChangeAmount,
      @required this.onChangeDate,
      @required this.onTapSubmit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Transfer Funds'),
      ),
      body: Container(
        margin: new EdgeInsets.all(15.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text('From'),
                width: double.infinity,
              ),
              FromAccountsDropDown(
                  viewModel: viewModel,
                  onChangeSelectedFromAccount: onChangeSelectedFromAccount),
              SizedBox(height: 15.0),
              Text('To'),
              SizedBox(height: 5.0),
              ToAccountsDropDown(
                viewModel: viewModel,
                onChangeSelectedToAccount: onChangeSelectedToAccount,
              ),
              SizedBox(height: 15.0),
              Text('Amount'),
              SizedBox(height: 15.0),
              TextField(
                onSubmitted: (String value) {
                  onChangeAmount(value);
                },
                keyboardType: TextInputType.number,
                controller: TextEditingController()
                  ..text =
                      viewModel.amount == 0 ? '' : viewModel.amount.toString(),
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: Text('\$ '),
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 0, minHeight: 0),
                ),
              ),
              SizedBox(height: 20.0),
              Text('Transfer date'),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: TextEditingController()
                  ..text = DateFormat('MM/dd/yyyy').format(viewModel.date),
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2021))
                      .then((date) {
                    onChangeDate(date);
                  });
                },
                readOnly: true,
              ),
              SizedBox(height: 15.0),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.black54,
                child: Text('Submit Transfer'),
                onPressed: () {
                  onTapSubmit();
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              )
            ]),
      ),
    );
  }
}
