// check if navigation is called when 'View Side Cash Account" button is tapped in the HUB

import 'dart:async';

import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock_dummy_functions.dart';

void main() {
  group('Side Cash Details Screen', () {
    testWidgets('Side Cash Details - has the proper elements',
        (WidgetTester tester) async {
      final completer = Completer<void>();

      final widget = Material(
        child: SideCashDetailsScreen(
          viewModel: SideCashDetailsViewModel(
            grossSideCashBalance: "1234.56",
            interest: "12.34",
            paymentMin: "23.45",
            remainingCredit: "345.67",
          ),
          toggleDetails: completer.complete,
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(FlatButton), findsNWidgets(1));
    });
  });
}
