import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/ui/transaction_presenter.dart';
import 'package:business_banking/features/transaction/ui/transaction_widget.dart';
import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Transactions, with true bloc', (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<TransactionBloc>(
        create: (_) => TransactionBloc(),
        child: TransactionWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(TransactionPresenter), findsOneWidget);
  });
}
