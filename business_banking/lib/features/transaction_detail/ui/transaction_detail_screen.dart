import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/transaction_detail/model/transaction_details_view_model.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransactionDetailScreen extends Screen {
  final TransactionDetailsViewModel viewModel;
  final VoidCallback navigateToTransactionDetail;
  const TransactionDetailScreen({
    @required this.viewModel,
    @required this.navigateToTransactionDetail,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: AutoSizeText('Transactions',
                    style: TextStyle(color: Colors.lightGreen, fontSize: 30.0)),
              ),
              RaisedButton(
                key: Key('transaction_details_button'),
                onPressed: () => CFRouterScope.of(context)
                    .push(BusinessBankingRouter.transferFundsRoute),
                child: Text(
                  'View Details',
                  style: TextStyle(color: Colors.black54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
