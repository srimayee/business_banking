import 'package:business_banking/features/stocks_portfolio/model/stock_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksListViewModel extends ViewModel {
  final List<StockViewModel> viewModelList;

  StocksListViewModel({required this.viewModelList});

  @override
  List<Object?> get props => [viewModelList];
}
