import 'package:business_banking/features/billpay/model/billpay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BillPayScreen extends Screen {
  //
  final BillPayViewModel viewModel;
  final Function startPayTap;

  BillPayScreen({this.viewModel, this.startPayTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BillPayUI(
          viewModel: viewModel,
          startPayTap: startPayTap,
        ),
      ],
    );
  }
}

class BillPayUI extends StatelessWidget {
  const BillPayUI({
    Key key,
    @required this.viewModel,
    this.startPayTap,
  }) : super(key: key);

  final BillPayViewModel viewModel;
  final Function startPayTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          DropdownButton<String>(
            items: <String>['Jim', 'John', 'Jack', 'James', 'Jessica']
                .map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {
              //
            },
          ),
          TextField(),
          FlatButton(
            key: Key('PayBtn'),
            onPressed: () {
              FocusScope.of(context).unfocus();
              startPayTap();
            },
            child: Text('Pay'),
          )
        ],
      ),
    );
  }
}
