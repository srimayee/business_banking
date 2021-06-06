// @dart=2.9
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stock_details_presenter.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stock_details_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('StockDetailsWidget widget test', (tester) async {
    final widget = MaterialApp(
        home: BlocProvider(
            create: (_) => StocksBloc(), child: StockDetailsWidget()));

    await tester.pumpWidget(widget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(StockDetailsPresenter), findsOneWidget);
  });
}
