import 'package:business_banking/features/qr_code_generator/bloc/qr_code_generator_bloc.dart';
import 'package:business_banking/features/qr_code_generator/ui/qr_code_generator_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class QRCodeGeneratorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QRCodeGeneratorBloc>(
      create: (_) => QRCodeGeneratorBloc(),
      child: QRCodeGeneratorPresenter(),
    );
  }
}
