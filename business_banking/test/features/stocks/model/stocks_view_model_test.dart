import 'package:business_banking/features/stocks_detail/model/stocks_view_model.dart';
import 'package:test/test.dart';

void main() {
  List<Map<String, dynamic>> stocksList = [
    {
      "company": "Amazon.com",
      "symbol": "AMZN",
      "at_close": 89.38,
      "shares": 100,
      "value": 8938.0
    }
  ];
  test('StocksViewModel initializes ', () async {
    final viewModel = StocksViewModel(stocksList: stocksList);

    expect(viewModel.stocksList, stocksList);
  });

  test('StocksViewModel has correct properties', () {
    StocksViewModel viewModel = StocksViewModel(stocksList: stocksList);
    expect(viewModel.props, [
      [
        {
          "company": "Amazon.com",
          "symbol": "AMZN",
          "at_close": 89.38,
          "shares": 100,
          "value": 8938.0
        }
      ]
    ]);
  });
}
