//@dart=2.9
import 'package:business_banking/features/stocks_portfolio/api/delete_stock_requestModel.dart';
import 'package:business_banking/features/stocks_portfolio/api/delete_stock_responseModel.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/delete_stock_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Test correct request created', () {
    StockEntity stockEntity = StockEntity(
        company: 'test', symbol: 'test', atClose: 1.0, shares: 1.0, value: 1.0);
    StocksListEntity entity = StocksListEntity(stocks: [stockEntity]);
    DeleteStockRequestModel model =
        DeleteStockServiceAdapter().createRequest(entity);
    Map<String, dynamic> json = model.toJson();
    expect(json['company'], 'test');
  });
  test('Correct DeleteStockEntity created by DeleteStockServiceAdapter', () {
    final entity = DeleteStockServiceAdapter().createEntity(
        StocksListEntity(),
        DeleteStockResponseModel.fromJson({
          "stocks": [
            {
              "company": "Amazon.com",
              "symbol": "AMZN",
              "at_close": 89.38,
              "shares": 100.0,
              "value": 8938.00
            },
          ]
        }));

    expect(
        entity,
        StocksListEntity(stocks: [
          StockEntity(
              company: 'Amazon.com',
              symbol: 'AMZN',
              atClose: 89.38,
              shares: 100.0,
              value: 8938.00)
        ]));
  });
}
