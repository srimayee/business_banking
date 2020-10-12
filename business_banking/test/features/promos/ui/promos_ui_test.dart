import 'package:business_banking/features/promos/ui/promos_presenter.dart';
import 'package:business_banking/features/promos/ui/promos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Promos widget has the proper elements', (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: PromosWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(PromoPresenter), findsOneWidget);
  });
}
