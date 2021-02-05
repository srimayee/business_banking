import 'dart:convert';

import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_service_adapter.dart';
import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_response_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get Side Cash Repository', () {
    final Map<String, dynamic> resObject = {
      'success': true,
    };

    final entity = GetSideCashServiceAdapter().createEntity(
      GetSideCashEntity(),
      GetSideCashResponseModel.fromJson(
        resObject,
      ),
    );
    expect(entity, isNotNull);
  });
}
