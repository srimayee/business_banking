import 'package:business_banking/features/billpay/ui/billpay_widget.dart';
import 'package:flutter/material.dart';

class BillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Bill Pay',
          key: Key('CBillPayAppBarTitle'),
        ),
        leading: IconButton(
          key: Key('BillPayBackBtn'),
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
                child: Text(
              'Welcome',
              style: TextStyle(fontSize: 18),
            )),
            height: 80,
          ),
          BillPayFeatureWidget(),
        ],
      ),
    );
  }
}
