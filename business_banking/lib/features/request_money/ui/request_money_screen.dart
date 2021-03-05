import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:business_banking/features/request_money/model/request_money_view_model.dart';

class RequestMoneyScreen extends Screen {
  final RequestMoneyViewModel viewModel;

  RequestMoneyScreen(
      {@required this.viewModel})
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
              Expanded(
                  child: ListTile(
                    title: Text('amount'),
                    subtitle: Text(viewModel.amount.toString()),
                  )
              ),
              Expanded(
                  child: ListTile(
                    title: Text('memo'),
                    subtitle: Text(viewModel.memo),
                  )
              )
            ])
        ),
      ),
    );
  }
}