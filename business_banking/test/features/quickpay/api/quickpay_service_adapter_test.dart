import 'package:business_banking/features/quickpay/api/quickpay_service_response_model.dart';
import 'package:business_banking/features/quickpay/bloc/quickpay_service_adapter.dart';
import 'package:business_banking/features/quickpay/model/quickpay_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = QuickPayServiceAdapter().createEntity(
        QuickPayEntity(),
        QuickPayServiceResponseModel.fromJson({
          'name': 'user name',
          'email': 'username@gmail.com',
          'imageUrl': ''
        }));

    expect(entity, QuickPayEntity(
        name: 'user name',
        email: 'username@gmail.com',
        imageUrl: ''
    ));
  });
}