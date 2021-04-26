import 'package:business_banking/features/stocks_detail/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'stocks_screen.dart';

class StocksPresenter
    extends Presenter<StocksBloc, StocksViewModel, StocksScreen> {
  @override
  StocksScreen buildScreen(
      BuildContext context, StocksBloc bloc, StocksViewModel viewModel) {
    return StocksScreen(viewModel: viewModel);
  }

  @override
  Stream<StocksViewModel> getViewModelStream(StocksBloc bloc) {
    return bloc.stocksViewModelPipe.receive;
  }
}
