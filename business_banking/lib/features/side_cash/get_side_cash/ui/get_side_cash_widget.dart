import 'package:flutter/material.dart';

class GetSideCashWidget extends StatelessWidget {
  const GetSideCashWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Request More Side Cash'),
        TextFormField(),
        MaterialButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.green,
            child: Text('Get Side Cash'),
          ),
        ),
      ],
    );
  }
}
