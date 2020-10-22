import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_bloc.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_list_view_model.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_presenter.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_screen.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/cash_accounts_bloc_mock.dart';
import '../bloc/cash_accounts_bloc_test.dart';
import '../ui/cash_accounts_widget_test.dart';

/// This test class will test the widget UI against the pre-formatted
/// Golden Test image.
void main() {

  // Widget createCashAccountsWidgetUI() {
  //   return Center(
  //     child: RepaintBoundary(
  //         child: CashAccountsWidgetTest()),
  //   );
  // }
  //
  // createCashAccountsWidgetUI2() {
  //
  // }


  /// Test Title
  testWidgets('Cash Accounts Golden test', (tester) async {

    /// Configure the Widget to be rendered with the associated
    /// BLoc.
    final testWidget = MaterialApp(
      home: Scaffold(
        body: CashAccountsWidgetTest(),
      ),
    );

    /// Render the Widget UI
    await tester.pumpWidget(testWidget);

    /// Provide buffer for rendering the Widget UI
    await tester.pump(Duration(milliseconds: 500));

    /// After the Golden Test image is rendered, test against it
     await expectLater(
         find.byType(CashAccountsPresenter), matchesGoldenFile('cashAccountsGoldenTest.png'));
  });
}
