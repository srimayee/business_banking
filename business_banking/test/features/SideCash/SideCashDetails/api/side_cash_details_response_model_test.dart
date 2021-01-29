import 'dart:convert';

import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SideCashDetailsServiceResponseModel', () {
    _getSideCashDetailsResponseModel() {
      SideCashDetailsResponseModel responseModel =
          SideCashDetailsResponseModel.fromJson(
        json.decode(
          '''{
            "grossSideCashBalance": "1234.56",
            "interest": "12.34",
            "paymentMin": "23.45",
            "remainingCredit": "345.67"
          }''',
        ),
      );

      return responseModel;
    }

    test(
      "response model has props",
      () {
        SideCashDetailsResponseModel responseModel =
            _getSideCashDetailsResponseModel();
        expect(responseModel.props, ["1234.56", "12.34", "23.45", "345.67"]);
      },
    );
  });
}
