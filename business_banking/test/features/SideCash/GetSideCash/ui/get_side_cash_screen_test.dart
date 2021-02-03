import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../SideCashDetails/mock_dummy_functions.dart';

void main() {
  group('Side Cash Details Screen', () {
    testWidgets('Side Cash Details - has the proper elements',
        (WidgetTester tester) async {
      final onControllerEvent = MockDummyFunctions().emptyCallback();
      final onRequestSideCash = MockDummyFunctions().emptyCallback();

      final widget = Material(
        child: GetSideCashScreen(
          inputController: TextEditingController(text: ''),
          onControllerChanged: onControllerEvent,
          requestSideCash: onRequestSideCash,
          viewModel: GetSideCashViewModel(
            amountRequested: '',
            requestSuccess: null,
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(FlatButton), findsNWidgets(1));
    });
    testWidgets(
        'Side Cash Details - displays error message if there is an error',
        (WidgetTester tester) async {
      final onControllerEvent = MockDummyFunctions().emptyCallback();
      final onRequestSideCash = MockDummyFunctions().emptyCallback();

      final widget = Material(
        child: GetSideCashScreen(
          inputController: TextEditingController(text: ''),
          onControllerChanged: onControllerEvent,
          requestSideCash: onRequestSideCash,
          viewModel: GetSideCashViewModel(
            amountRequested: '',
            requestSuccess: null,
            error: 'There is an error',
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(FlatButton), findsNWidgets(1));
    });
  });
}
