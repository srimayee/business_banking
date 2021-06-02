import 'package:business_banking/features/stocks_portfolio/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_portfolio_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stocks_list_widget.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'stocks_portfolio_screen.dart';

class StocksPortfolioPresenter extends Presenter<StocksBloc,
    StocksPortfolioViewModel, StockPortfolioScreen> {
  @override
  StockPortfolioScreen buildScreen(BuildContext context, StocksBloc bloc,
      StocksPortfolioViewModel viewModel) {
    return StockPortfolioScreen(
        viewModel: viewModel,
        navigateToStocksScreen: () {
          _navigateToStocksScreen(context);
        });
  }

  @override
  Stream<StocksPortfolioViewModel> getViewModelStream(StocksBloc bloc) {
    return bloc.stocksPortfolioViewModelPipe.receive;
  }

  void _navigateToStocksScreen(BuildContext context) {
    // CFRouterScope.of(context).push(BusinessBankingRouter.stocksListScreenRoute);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => StocksListWidget()));
  }
}
