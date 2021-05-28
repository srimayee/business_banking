import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  StockDetailsViewModel viewModel = StockDetailsViewModel(
      company: 'Disney',
      symbol: 'DIS',
      value: 100.0,
      atOpen: 100.0,
      highValue: 100.0,
      lowValue: 100.0,
      volume: '3.98M',
      history: [
        {'5_24': 100.0}
      ]);

  test('StockDetailsViewModel has correct properties', () {
    expect(viewModel.props, [
      'Disney',
      'DIS',
      100.0,
      100.0,
      100.0,
      100.0,
      '3.98M',
      [
        {'5_24': 100.0}
      ]
    ]);
  });
}
