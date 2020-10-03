import 'package:business_banking/features/transfer_funds/api/transfer_response_model.dart';
import 'package:business_banking/features/transfer_funds/bloc/transfer_service_adapter.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO test failed
  test('Entity for transfer to send is created by service adapter', () {
    final entity = TransferFundsServiceAdapter().createEntity(
        TransferFundsEntity(),
        TransferFundsResponseModel.fromJson({"confirmation" : "123456789"}));

    expect(
        entity,
        TransferFundsEntity(
            id: '123456789'));
  });
}