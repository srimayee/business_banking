import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransferConfirmationScreen extends Screen {
  final TransferConfirmationViewModel viewModel;
  // final Function navigateToHubScreen;
  final Function navigateToTransferScreen;

  TransferConfirmationScreen(
      {@required this.viewModel,
      @required this.navigateToTransferScreen
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Transfer Confirmation'),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane(
                    'Confirmation #:', viewModel.id ?? 'not defined'),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane('Transfer Date',
                    DateFormat('MM/dd/yyyy').format(viewModel.date)),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane('From', viewModel.fromAccount),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane('To', viewModel.toAccount),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane('Amount', '\$' + viewModel.amount.toString()),
                SizedBox(
                  height: 15.0,
                ),
                TransactionLane('Type', 'Transfer'),
                SizedBox(
                  height: 15.0,
                ),
                RaisedButton(
                  child: Text('Make Another Transfer'),
                  color: Colors.black54,
                  textColor: Colors.white,
                  onPressed: navigateToTransferScreen,
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
  final String value;

  TransactionLane(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 15.0)),
        Text(value, style: TextStyle(fontSize: 15.0))
      ],
    );
  }
}
