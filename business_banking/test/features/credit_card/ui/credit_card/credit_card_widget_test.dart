// @dart=2.9

import 'package:business_banking/features/credit_card/ui/credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: CreditCardWidget(),
    );
  });

  tearDown(() {
    testWidget = null;
  });

  testWidgets('CreditCardWidget initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(CreditCardWidget), findsOneWidget);
  });
}
