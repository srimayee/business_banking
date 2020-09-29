import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_bloc.dart';
import 'package:business_banking/features/mortgage_account_details/ui/mortgage_account_detail_presenter.dart';
import 'package:business_banking/features/mortgage_account_details/ui/mortgage_account_detail_screen.dart';
import 'package:business_banking/features/mortgage_account_details/ui/mortgage_account_detail_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MortgageAccountDetail, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<MortgageAccountDetailBloc>(
            create: (_) => MortgageAccountDetailBloc(), child: MortgageAccountDetailWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(MortgageAccountDetailPresenter), findsOneWidget);
    expect(find.byType(MortgageAccountDetailScreen), findsOneWidget);
    expect(find.byKey(Key('mortagageDetailsAppBarL4')), findsOneWidget);
    expect(find.text('Show'), findsOneWidget);
    expect(find.text('Account Number: ••••••'), findsOneWidget);
    expect(find.text('Routing Number: '), findsOneWidget);
    expect(find.text('Account Type: '), findsOneWidget);
    expect(find.text('Account Balance:'), findsOneWidget);
    expect(find.text('Deposit Holds:'), findsOneWidget);
    expect(find.text('Pending Transactions:'), findsOneWidget);
    expect(find.text('Beginning Balance:'), findsOneWidget);
    expect(find.text('mortagageAccountDetailBalance'), findsOneWidget);
    expect(find.text('account balance'), findsOneWidget);
  });

  testWidgets('MortgageAccountDetailBackNavigation, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<MortgageAccountDetailBloc>(
            create: (_) => MortgageAccountDetailBloc(), child: MortgageAccountDetailWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    await tester.tap(find.byKey(Key('mortagageDetailsBackButton')));
    await tester.pumpAndSettle();
  });
}