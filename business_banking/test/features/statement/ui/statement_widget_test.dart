// @dart=2.9
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/statement/bloc/statement_bloc.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement_info.dart';
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_presenter.dart';
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_widget.dart';
import 'package:business_banking/features/statement/ui/statement/statement_presenter.dart';
import 'package:business_banking/features/statement/ui/statement/statement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  testWidgets('WIDGET TEST: Statement Widget loaded successfully!',
      (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: StatementWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(StatementPresenter), findsOneWidget);
  });

  testWidgets('WIDGET TEST: StatementCard Widget loaded successfully!',
      (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: StatementCardWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(StatementCardPresenter), findsOneWidget);
  });

  group('presenter actions testing', () {
    final bloc = StatementBloc();
    final actions = StatementPresenterActions(bloc);
    final context = MockBuildContext();

    test('send email actions', () {
      final statement = Statement(
          accountInfo: AccountInfoStruct(
              accountNickname: 'HNB Credit Card (6917)',
              accountNumber: '1234567890126917',
              availableBalance: 481.84,
              depositLimit: 4500.0),
          statementActivity: [
            StatementActivity(
                "LYFT RIDE", "04/13/2021 00:00:00", null, 200.00, 1200.00),
            StatementActivity(
                "PAYCHECK", "04/14/2021 00:00:00", null, 400.00, 1600.00)
          ]);

      actions.sendStatementToEmail(context, statement);

      expect(find.byType(AlertDialog), findsOneWidget);
    });
  });
}
