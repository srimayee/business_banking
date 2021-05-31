import 'package:business_banking/features/stocks_portfolio/api/delete_stock_requestModel.dart';
import 'package:business_banking/features/stocks_portfolio/api/delete_stock_responseModel.dart';
import 'package:business_banking/features/stocks_portfolio/api/delete_stock_service.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('DeleteStockService success', () async {
    final service = DeleteStockService();
    final request = DeleteStockRequestModel();
    final Either<ServiceFailure, DeleteStockResponseModel> eitherResponse =
        await service.request(requestModel: request);

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        DeleteStockResponseModel.fromJson({
          'stocks': [
            {
              "company": "Amazon.com",
              "symbol": "AMZN",
              "at_close": 89.38,
              "shares": 100,
              "value": 8938.0
            },
            {
              "company": "Disney",
              "symbol": "DIS",
              "at_close": 40.65,
              "shares": 100,
              "value": 4065.00
            },
            {
              "company": "PepsiCo",
              "symbol": "PEP",
              "at_close": 38.02,
              "shares": 100,
              "value": 3802.00
            },
            {
              "company": "Apple",
              "symbol": "AAPL",
              "at_close": 134.22,
              "shares": 100,
              "value": 13422.00
            },
            {
              "company": "Home Depot",
              "symbol": "HD",
              "at_close": 323.60,
              "shares": 100,
              "value": 32360.00
            },
          ]
        }));
  });
}
