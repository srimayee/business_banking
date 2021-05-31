import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_view_model.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<StockViewModel> viewModelList = [
    StockViewModel('test', 'test', 1.0, 1.0, 1.0)
  ];

  test('StocksListViewModel has correct properties', () {
    StocksListViewModel viewModel =
        StocksListViewModel(viewModelList: viewModelList);
    expect(viewModel.props, [
      [StockViewModel('test', 'test', 1.0, 1.0, 1.0)]
    ]);
  });
}
