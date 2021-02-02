import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_widget.dart';
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
    bool isOpen = false;
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
          StreamBuilder<bool>(
            stream: bloc.toggleDetails.receive,
            builder: (ctx, snapshot) {
              if (snapshot.data == false || snapshot.data == null) {
                return _expandButton(snapshot.data ?? false);
              }
              return _expandButton(snapshot.data);
            },
          ),
          StreamBuilder<bool>(
            stream: bloc.toggleDetails.receive,
            builder: (ctx, snapshot) {
              if (snapshot.data == true) {
                return GetSideCashWidget();
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  FlatButton _expandButton(bool isOpen) {
    return FlatButton(
      color: Colors.green,
      key: Key('toggle-cash-details-button'),
      onPressed: () async {
        isOpen = !isOpen;
        toggleDetails(bloc, isOpen);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Details'),
          isOpen
              ? Icon(Icons.keyboard_arrow_up)
              : Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}
