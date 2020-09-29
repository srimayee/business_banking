import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_bloc.dart';
import 'package:business_banking/features/mortgage_accounts/ui/mortgage_accounts_presenter.dart';
import 'package:business_banking/features/mortgage_accounts/ui/mortgage_accounts_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('MortagageAccounts Golden test', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<MortgageAccountsBloc>(
            create: (_) => MortgageAccountsBloc(), child: MortgageAccountsWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    await expectLater(find.byType(MortgageAccountsPresenter), matchesGoldenFile('main.png'));
  });
}