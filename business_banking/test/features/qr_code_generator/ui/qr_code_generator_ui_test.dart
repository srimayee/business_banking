import 'package:business_banking/features/qr_code_generator/bloc/qr_code_generator_bloc.dart';
import 'package:business_banking/features/qr_code_generator/ui/qr_code_generator_presenter.dart';
import 'package:business_banking/features/qr_code_generator/ui/qr_code_generator_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('QRCodeGenerator, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<QRCodeGeneratorBloc>(
            create: (_) => QRCodeGeneratorBloc(),
            child: QRCodeGeneratorWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(QRCodeGeneratorPresenter), findsOneWidget);
  });
}
