import 'package:business_banking/features/stocks_portfolio/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stock_details_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';

class StockDetailsPresenter
    extends Presenter<StocksBloc, StockDetailsViewModel, StockDetailsScreen> {
  @override
  StockDetailsScreen buildScreen(
      BuildContext context, bloc, StockDetailsViewModel viewModel) {
    return StockDetailsScreen(viewModel: viewModel);
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Stream<StockDetailsViewModel> getViewModelStream(bloc) {
    return bloc.stockDetailsViewModelPipe.receive;
  }
}
