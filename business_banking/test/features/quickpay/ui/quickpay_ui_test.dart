import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/quickpay/bloc/quickpay_bloc.dart';
import 'package:business_banking/features/quickpay/ui/quickpay_widget.dart';
import 'package:business_banking/features/quickpay/ui/quickpay_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('QuickPay, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<QuickPayBloc>(
            create: (_) => QuickPayBloc(), child: QuickPayWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(QuickPayPresenter), findsOneWidget);
  });
}