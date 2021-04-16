import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransferConfirmationScreen extends Screen {
  final TransferConfirmationViewModel viewModel;

  // final Function navigateToHubScreen;
  final Function navigateToTransferScreen;

  TransferConfirmationScreen(
      {required this.viewModel, required this.navigateToTransferScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Transfer Confirmation',
            key: Key('transfer_confirmation_bar_title')),
        leading: new Container(),
      ),
      body: Container(
        margin: new EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Transaction',
                    key: Key('transaction_confirmation_title'),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane(
                    'Confirmation #:',
                    viewModel.id ?? 'not defined',
                    'transfer_confirmation_id_label',
                    'transfer_confirmation_id_field'),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane(
                    'Transfer Date',
                    DateFormat('MM/dd/yyyy').format(viewModel.date!),
                    'transfer_confirmation_date_label',
                    'transfer_confirmation_date_field'),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane(
                    'From',
                    viewModel.fromAccount,
                    'transfer_confirmation_from_account_label',
                    'transfer_confirmation_from_account_field'),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane(
                    'To',
                    viewModel.toAccount,
                    'transfer_confirmation_to_account_label',
                    'transfer_confirmation_to_account_field'),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane(
                    'Amount',
                    '\$' + viewModel.amount.toString(),
                    'transfer_confirmation_amount_label',
                    'transfer_confirmation_amount_field'),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane(
                    'Type',
                    'Transfer',
                    'transfer_confirmation_type_label',
                    'transfer_confirmation_type_field'),
                SizedBox(
                  height: 15.0,
                ),
                RaisedButton(
                  key: Key('make_another_transfer_button'),
                  child: Text('Make Another Transfer'),
                  color: Colors.black54,
                  textColor: Colors.white,
                  onPressed: navigateToTransferScreen as void Function()?,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

class TransactionLane extends StatelessWidget {
  final String label;
  final String? value;
  final String labelKey;
  final String valueFieldKey;

  TransactionLane(this.label, this.value, this.labelKey, this.valueFieldKey);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 15.0), key: Key(labelKey)),
        Text(value!, style: TextStyle(fontSize: 15.0), key: Key(valueFieldKey))
      ],
    );
  }
}
