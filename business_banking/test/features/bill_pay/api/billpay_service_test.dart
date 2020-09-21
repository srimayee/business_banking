import 'package:business_banking/features/billpay/api/billpay_service.dart';
import 'package:business_banking/features/billpay/api/billpay_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BillPay service success', () async {
    final service = BillPayService();
    final eitherResponse = await service.request();
    expect(eitherResponse.isRight, isTrue);
    expect(
      eitherResponse.fold((_) {}, (m) => m),
      BillPayServiceResponseModel.fromJson({'succeeded': true}),
    );
  });
}
