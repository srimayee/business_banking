import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TransferConfirmationScreen extends Screen {
  final TransferFundsViewModel viewModel;

  TransferConfirmationScreen(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Transfer Confirmation'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){ Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new HubScreen()));}
        ),
      ),
      body: Container(
        margin: new EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Transaction', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
                SizedBox(height: 15.0,),
                TransactionLane('Confirmation #:', viewModel.id ?? 'not defined'),
                SizedBox(height: 15.0,),
                TransactionLane('Transfer Date', DateFormat('MM/dd/yyyy').format(viewModel.date)),
                SizedBox(height: 15.0,),
                TransactionLane('From', viewModel.fromAccount),
                SizedBox(height: 15.0,),
                TransactionLane('To', viewModel.toAccount),
                SizedBox(height: 15.0,),
                TransactionLane('Amount', '\$' + viewModel.amount.toString()),
                SizedBox(height: 15.0,),
                TransactionLane('Type', 'Transfer'),
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