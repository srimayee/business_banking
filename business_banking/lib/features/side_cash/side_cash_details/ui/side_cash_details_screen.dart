import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_bloc.dart';
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
          _expandButton(isOpen: viewModel.detailsOpen ?? false, bloc: bloc),
          viewModel.detailsOpen ?? false ? GetSideCashWidget() : Container(),
        ],
      ),
    );
  }

  FlatButton _expandButton(
      {@required bool isOpen, @required SideCashDetailsBloc bloc}) {
    return FlatButton(
      color: Colors.green,
      key: Key('toggle-cash-details-button'),
      onPressed: () => toggleDetails(isOpen, bloc),
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
