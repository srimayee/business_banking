import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../lib/features/mortgage/ui/mortgage_presenter.dart';
import '../../../../lib/features/mortgage/ui/mortgage_widget.dart';

void main() {
  testWidgets('CustomerWidget, with true bloc', (tester) async {
    final testWidget = MaterialApp(home: MortgageWidget());
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(MortgagePresenter), findsOneWidget);

    await tester.tap(find.byType(MortgagePresenter));
  });
}
