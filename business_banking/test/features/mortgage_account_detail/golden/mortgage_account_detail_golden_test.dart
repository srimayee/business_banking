import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_bloc.dart';
import 'package:business_banking/features/mortgage_account_details/ui/mortgage_account_detail_presenter.dart';
import 'package:business_banking/features/mortgage_account_details/ui/mortgage_account_detail_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MortgageAccountDetail Golden test', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<MortgageAccountDetailBloc>(
            create: (_) => MortgageAccountDetailBloc(), child: MortgageAccountDetailWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    await expectLater(find.byType(MortgageAccountDetailPresenter), matchesGoldenFile('main.png'));
  });
}