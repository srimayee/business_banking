import 'package:business_banking/features/stocks_detail/api/stocks_service.dart';
import 'package:business_banking/features/stocks_detail/bloc/stocks_usecase.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksBloc extends Bloc {
  late StocksUseCase _useCase;
  final stocksViewModelPipe = Pipe<StocksViewModel>();

  @override
  void dispose() {
    stocksViewModelPipe.dispose();
  }

  StocksBloc({StocksService? stocksService}) {
    _useCase = StocksUseCase(
        (viewModel) => stocksViewModelPipe.send(viewModel as StocksViewModel));
    stocksViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
