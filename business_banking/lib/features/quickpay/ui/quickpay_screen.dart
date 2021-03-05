import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:business_banking/features/quickpay/model/quickpay_view_model.dart';

class QuickPayScreen extends Screen {
  final QuickPayViewModel viewModel;
  final VoidCallback navigateToMakePayment;

  QuickPayScreen(
      {@required this.viewModel, @required this.navigateToMakePayment})
      : assert(() {
    return viewModel != null;
  }());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(5.0),
      child: Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child:Column(children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text('Name'),
                  subtitle:
                  Text(viewModel.name),
                  )
              ),
                Expanded(
                  child: ListTile(
                    title: Text('Email'),
                    subtitle: Text(viewModel.email),
                  )
                ),
                  RaisedButton(
                    child: Text("Request Money"),
                    onPressed: () {
                      navigateToMakePayment();
                    },
                  )
              ])
        ),
      ),
    );
  }
}