import 'package:business_banking/features/transfer_funds/api/transfer_response_model.dart';
import 'package:business_banking/features/transfer_funds/api/transfer_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TransferFundsServiceTest success', () async {
    final service = TransferFundsService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        TransferFundsResponseModel.fromJson({"confirmation" : "123456789"})
    );
  });
}