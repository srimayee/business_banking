import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../SideCashDetails/mock_dummy_functions.dart';

void main() {
  group('Get Side Cash Screen', () {
    final onControllerEvent = MockDummyFunctions().emptyCallback();
    final onRequestSideCash = MockDummyFunctions().emptyCallback();

    _constructScreen(GetSideCashViewModel viewModel) {
      return MaterialApp(
        home: Scaffold(
          body: GetSideCashScreen(
            inputController: TextEditingController(),
            onControllerChanged: onControllerEvent,
            requestSideCash: onRequestSideCash,
            viewModel: viewModel,
          ),
        ),
      );
    }

    testWidgets('Get Side Cash - has the proper elements',
        (WidgetTester tester) async {
      final testApp = _constructScreen(GetSideCashViewModel());
      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();

      expect(find.byKey(Key('getSideCashWidgetKey')), findsOneWidget);
    });
    testWidgets(
        'Side Cash Details - displays error message if there is an error',
        (WidgetTester tester) async {
      final testApp =
          _constructScreen(GetSideCashViewModel(error: "There is an error!"));
      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();

      expect(find.byKey(Key('SideCashDetailsErrorMessage')), findsNWidgets(1));
    });
    testWidgets(
        'Side Cash Details - displays a success message with success view model',
        (WidgetTester tester) async {
      final testApp =
          _constructScreen(GetSideCashViewModel(requestSuccess: true));
      await tester.pumpWidget(testApp);
      await tester.pumpAndSettle();
      expect(
          find.byKey(Key('SideCashDetailsSuccessMessage'), skipOffstage: false),
          findsNWidgets(1));
    });
  });
}
