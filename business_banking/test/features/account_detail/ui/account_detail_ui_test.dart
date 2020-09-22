import 'package:business_banking/features/cash_accounts/bloc/account_detail_bloc.dart';
import 'package:business_banking/features/account_detail/ui/account_detail_presenter.dart';
import 'package:business_banking/features/account_detail/ui/account_detail_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AccountDetail, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<AccountDetailBloc>(
            create: (_) => AccountDetailBloc(), child: AccountDetailWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(AccountDetailPresenter), findsOneWidget);
  });
}