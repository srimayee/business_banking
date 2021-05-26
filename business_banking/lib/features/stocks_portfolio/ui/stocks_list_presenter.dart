import 'package:business_banking/features/stocks_portfolio/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/ui/stocks_list_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class StocksListPresenter
    extends Presenter<StocksBloc, StocksListViewModel, StocksListScreen> {
  @override
  StocksListScreen buildScreen(
      BuildContext context, StocksBloc bloc, StocksListViewModel viewModel) {
    return StocksListScreen(
      viewModel: viewModel,
      onAddDeleteTapped: () {
        _onAddDeleteTapped(bloc);
      },
    );
  }

  @override
  Stream<StocksListViewModel> getViewModelStream(StocksBloc bloc) {
    return bloc.stocksListViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _onAddDeleteTapped(StocksBloc bloc) {
    bloc.deleteStockPipe.send(0);
  }
}
