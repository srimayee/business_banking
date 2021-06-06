// @dart= 2.9
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stocks_portfolio_presenter.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stocks_portfolio_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('StocksPortfolioWidget widget test', (tester) async {
    final stocksWidget = MaterialApp(
      home: BlocProvider(
        create: (_) => StocksBloc(),
        child: StocksPortfolioWidget(),
      ),
    );

    await tester.pumpWidget(stocksWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(StocksPortfolioPresenter), findsOneWidget);
  });
}
