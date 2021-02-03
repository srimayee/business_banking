import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock_dummy_functions.dart';

void main() {
  group('Side cash card on Hub Screen', () {
    final dummyNavigation = MockDummyFunctions();
    testWidgets('Side Cash Details - has the proper elements',
        (WidgetTester tester) async {
      final widget = SideCashDetailsCardWidget(
        navigationTester: dummyNavigation.emptyCallback(),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      // expect(find.byType(OutlineButton), findsNWidgets(1));
      tester.tap(find.byType(OutlineButton));
      verify(dummyNavigation.emptyCallback()).called(1);
    });
  });
}
