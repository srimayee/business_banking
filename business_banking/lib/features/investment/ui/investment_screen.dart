import 'dart:ui';

import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../model/investment_view_model.dart';

class InvestmentScreen extends Screen {
  final InvestmentViewModel viewModel;
  final VoidCallback navigateToInvestmentDetail;

  InvestmentScreen(
      {@required this.viewModel, @required this.navigateToInvestmentDetail})
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
            key: Key('investmentCard1'),
          ),
          onTap: () {
            navigateToInvestmentDetail();
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

  final InvestmentViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'investment Account Balance',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    new Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              new Container(
                color: Colors.grey.withOpacity(.5),
                width: MediaQuery.of(context).size.width,
                height: 1,
              ),
              new SizedBox(height: 15),
              new Expanded(
                child: new Center(
                  child: new Text(
                    "Account value / Today's net change",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                ),
              ),
              new Expanded(
                child: new Text(
                  '\$${viewModel.accountBalance}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              new Expanded(
                  child: Text(
                '\$${viewModel.totalGainValue} (${viewModel.totalGainPercent}%)',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
