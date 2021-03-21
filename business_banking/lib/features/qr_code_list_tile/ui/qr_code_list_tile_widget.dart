import 'package:business_banking/features/qr_code_generator/ui/qr_code_generator_widget.dart';
import 'package:flutter/material.dart';

class QRCodeListTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Container(
              margin: EdgeInsets.only(bottom: 60),
              padding: EdgeInsets.all(5.0),
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ListTile(
                        title: Text('QRCode'),
                        trailing: RaisedButton(
                          child: Text("Generate"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  settings: RouteSettings(name: 'seed'),
                                  builder: (context) =>
                                      QRCodeGeneratorWidget()),
                            );
                          },
                        ))),
              )))
    ]);
  }
}
