import 'package:business_banking/features/customer/model/customer_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CustomerScreen extends Screen {
  final CustomerViewModel viewModel;
  final VoidCallback navigateToCustomerDetail;

  CustomerScreen(
      {@required this.viewModel, @required this.navigateToCustomerDetail})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FlatButton(
                  key: Key("HCTileButton"),
                  onPressed: () => navigateToCustomerDetail(),
                  child: Text(
                    "Hello ${viewModel.helloString}",
                    key: Key("HCTileText"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
