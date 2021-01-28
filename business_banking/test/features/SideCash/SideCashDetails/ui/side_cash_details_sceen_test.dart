// check if navigation is called when 'View Side Cash Account" button is tapped in the HUB

import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Scheduled Payments Screen', () {
    testWidgets('Scheduled Payments - has the proper elements',
        (WidgetTester tester) async {
      final widget = Material(
        child: SideCashDetailsScreen(viewModel: SideCashDetailsViewModel()),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      // expect(find.text(paymentsStrings.scheduledPayments), findsOneWidget);
      // expect(find.text(sharedStrings.cancel), findsOneWidget);
      // expect(find.text(paymentsStrings.noScheduledPayments), findsOneWidget);
    });
  });
}
