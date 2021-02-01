import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SideCashDetailsScreen extends Screen {
  final SideCashDetailsViewModel viewModel;
  final toggleDetails;
  final SideCashDetailsBloc bloc;

  SideCashDetailsScreen(
      {@required this.viewModel, @required this.toggleDetails, this.bloc})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Side Cash Account Details'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Side Cash Balance: "),
              Text(viewModel.grossSideCashBalance),
            ],
          ),
          Row(
            children: [
              Text('Interest: '),
              Text(viewModel.interest),
            ],
          ),
          Row(
            children: [
              Text('Minimum payment: '),
              Text(viewModel.paymentMin),
            ],
          ),
          Row(
            children: [
              Text('Remaining credit: '),
              Text(viewModel.remainingCredit),
            ],
          ),
          FlatButton(
            key: Key('toggle-cash-details-button'),
            onPressed: () async =>
                toggleDetails(bloc, await bloc.toggleDetails.receive.last),
            child: Text('Details'),
          )
        ],
      ),
    );
  }
}
