// @dart=2.9
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_presenter.dart';
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_widget.dart';
import 'package:business_banking/features/statement/ui/statement/statement_presenter.dart';
import 'package:business_banking/features/statement/ui/statement/statement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WIDGET TEST: Statement Widget loaded successfully!',
      (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: StatementWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(StatementPresenter), findsOneWidget);
  });

  testWidgets('WIDGET TEST: StatementCard Widget loaded successfully!',
      (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: StatementCardWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(StatementCardPresenter), findsOneWidget);
  });
}
