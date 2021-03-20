import 'dart:ui';

import 'package:business_banking/features/quickpay/model/quickpay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class QuickPayScreen extends Screen {
  final QuickPayViewModel viewModel;
  final VoidCallback navigateToMakePayment;
  final VoidCallback navigateToGenerateQrCode;

  QuickPayScreen(
      {@required this.viewModel,
      @required this.navigateToMakePayment,
      @required this.navigateToGenerateQrCode})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        padding: EdgeInsets.all(5.0),
        child: Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text('Name'),
              subtitle: Text(viewModel.name),
            )),
            Expanded(
                child: ListTile(
              title: Text('Email'),
              subtitle: Text(viewModel.email),
            )),
            Expanded(
                child: ListTile(
                    title: Text('QRCode'),
                    trailing: RaisedButton(
                      child: Text("Generate"),
                      onPressed: () {
                        navigateToGenerateQrCode();
                      },
                    ))),
            RaisedButton(
              child: Text("Request Money"),
              onPressed: () {
                navigateToMakePayment();
              },
            ),
          ]),
        )));
  }
}
