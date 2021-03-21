import 'package:business_banking/features/quickpay/bloc/quickpay_bloc.dart';
import 'package:business_banking/features/quickpay/ui/quickpay_presenter.dart';
import 'package:business_banking/features/quickpay/ui/quickpay_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testWidgets('QuickPay Golden test', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<QuickPayBloc>(
            create: (_) => QuickPayBloc(), child: QuickPayWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    await expectLater(
        find.byType(QuickPayPresenter), matchesGoldenFile('main.png'));
  });

  testGoldens(
      'golden test added to test exact image visually(another good way of writing golden tests)',
      (WidgetTester tester) async {
    await loadAppFonts();
    await tester.pumpWidgetBuilder(QuickPayWidget(),
        surfaceSize: const Size(500, 700),
        wrapper: materialAppWrapper(
            theme: ThemeData.light(), platform: TargetPlatform.android));
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'quickpay_golden');
  });
}
