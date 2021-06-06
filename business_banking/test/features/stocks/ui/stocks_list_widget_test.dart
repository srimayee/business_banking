// @dart= 2.9
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stocks_list_presenter.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stocks_list_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('StocksListWidget test with bloc', (tester) async {
    final widget = MaterialApp(
        home: BlocProvider(
            create: (_) => StocksBloc(), child: StocksListWidget()));

    await tester.pumpWidget(widget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(StocksListPresenter), findsOneWidget);
  });
}
