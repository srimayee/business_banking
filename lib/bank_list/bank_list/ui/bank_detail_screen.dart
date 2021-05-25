import 'package:app_interview/features_bank/bank_list/api/result_search_model.dart';
import 'package:flutter/material.dart';

class BankDetailPage extends StatelessWidget {
  final ResultSearchModel model;

  const BankDetailPage({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(model);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text('Detail Bank'),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            textTitle('Bank Name'),
            Text(model.name, style: TextStyle(fontSize: 24)),
            dividerLine(),
            textTitle('Phone'),
            Text(model.phone, style: TextStyle(fontSize: 18)),
            dividerLine(),
            textTitle('E-Mail'),
            Text(model.email, style: TextStyle(fontSize: 18)),
            dividerLine(),
            textTitle('Address'),
            Text('${model.street}, ${model.suite}',
                style: TextStyle(fontSize: 18)),
            dividerLine(),
            textTitle('City'),
            Text(model.city, style: TextStyle(fontSize: 18)),
            dividerLine(),
          ])),
    );
  }
  //street, suite, city, zipcode

  Widget dividerLine() {
    return Divider(
      color: Colors.teal[900],
    );
  }

  Widget textTitle(String textTitle) {
    return Text(textTitle, style: TextStyle(color: Colors.blueGrey));
  }
}
