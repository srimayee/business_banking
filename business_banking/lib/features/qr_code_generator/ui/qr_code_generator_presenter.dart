import 'dart:async';

import 'package:business_banking/features/qr_code_generator/bloc/qr_code_generator_bloc.dart';
import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_view_model.dart';
import 'package:business_banking/features/qr_code_generator/ui/qr_code_generator_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QRCodeGeneratorPresenter extends Presenter<QRCodeGeneratorBloc,
    QRCodeGeneratorViewModel, QRCodeGeneratorScreen> {
  @override
  Stream<QRCodeGeneratorViewModel> getViewModelStream(
      QRCodeGeneratorBloc bloc) {
    return bloc.qrCodeGeneratorViewModelPipe.receive;
  }

  @override
  QRCodeGeneratorScreen buildScreen(BuildContext context,
      QRCodeGeneratorBloc bloc, QRCodeGeneratorViewModel viewModel) {
    return QRCodeGeneratorScreen(
      viewModel: viewModel,
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            'QRCODE',
          ),
        ),
        body: Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            )));
  }
}
