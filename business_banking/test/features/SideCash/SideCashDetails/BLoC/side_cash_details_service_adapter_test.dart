import 'dart:convert';

import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_response_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_service_adapter.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Side Cash Details Repository', () {
    final Map<String, dynamic> resObject = {
      'grossSideCashBalance': '1234.56',
      'interest': '12.34',
      'paymentMin': '23.45',
      'remainingCredit': '345.67',
    };

    final entity = SideCashDetailsServiceAdapter().createEntity(
      SideCashDetailsEntity(),
      SideCashDetailsResponseModel.fromJson(
        resObject,
      ),
    );
    expect(entity, isNotNull);
  });
}
