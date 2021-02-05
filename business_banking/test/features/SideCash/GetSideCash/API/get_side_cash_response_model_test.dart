import 'dart:convert';

import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_response_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetSideCashResponseModel', () {
    _getSideCashResponseModel() {
      GetSideCashResponseModel responseModel =
          GetSideCashResponseModel.fromJson({"success": true});
      return responseModel;
    }

    test(
      "response model has true value",
      () {
        GetSideCashResponseModel responseModel = _getSideCashResponseModel();
        expect(responseModel.props, [true]);
      },
    );
  });
}
