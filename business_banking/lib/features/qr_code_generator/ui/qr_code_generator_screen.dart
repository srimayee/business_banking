import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_view_model.dart';
import 'package:business_banking/features/qr_code_generator/ui/count_down_timer.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGeneratorScreen extends Screen {
  final QRCodeGeneratorViewModel viewModel;

  QRCodeGeneratorScreen({@required this.viewModel})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            'QRCODE',
          ),
        ),
        body: viewModel.seed != '' && viewModel.expiresAt != ''
            ? ListView(children: <Widget>[
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 100.0, bottom: 50),
                              child: QrImage(
                                data: viewModel.seed + viewModel.expiresAt,
                                size: 300,
                              ))
                        ])),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 100.0),
                            child: CountDown(
                              viewModel.expiresAt,
                            )),
                      ])),
                ])
              ])
            : Column(children: <Widget>[
                Expanded(
                    child: Center(
                        child: Text(
                            'Oops, something went wrong. Try again later')))
              ]));
  }
}
