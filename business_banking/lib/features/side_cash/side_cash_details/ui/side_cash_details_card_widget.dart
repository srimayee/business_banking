import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_widget.dart';
import 'package:flutter/material.dart';

class SideCashDetailsCardWidget extends StatelessWidget {
  final Function navigationTester;
  const SideCashDetailsCardWidget({
    Key key,
    this.navigationTester,
  }) : super(key: key);

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
            children: <Widget>[
              Expanded(
                child: AutoSizeText('Side Cash Account Details',
                    style: TextStyle(color: Colors.lightGreen, fontSize: 30.0)),
              ),
              OutlineButton(
                key: Key('side_cash_details_nav_button'),
                onPressed: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SideCashDetailsWidget(),
                        maintainState: false)),
                borderSide: BorderSide(
                  color: Colors.black54, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
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
