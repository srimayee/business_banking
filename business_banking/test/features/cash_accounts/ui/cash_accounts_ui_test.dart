import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/bloc/bloc.dart';
import 'package:business_banking/features/cash_accounts/ui/widget.dart';
import 'package:business_banking/features/cash_accounts/ui/presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CashAccounts, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<CashAccountsBloc>(
            create: (_) => CashAccountsBloc(), child: CashAccountsWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(CashAccountsPresenter), findsOneWidget);
  });
}