import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_request_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_response_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_service.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('GetSideCashService successful', () async {
    final service = GetSideCashService();
    final requestModel = new GetSideCashRequestModel(amountRequested: "12.34");
    final eitherResponse = await service.request(requestModel: requestModel);

    expect(eitherResponse.isRight, isTrue);
    expect(eitherResponse.fold((_) {}, (m) => m),
        GetSideCashResponseModel.fromJson({"success": true}));
  });
}
