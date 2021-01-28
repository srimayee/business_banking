import 'package:flutter_test/flutter_test.dart';

main() {
  test('GetSideCashService successful', () {
    final service = GetSideCashService();
    final requestModel =
        new GetSideCashRequestModel({amountRequested: "12.34"});
    final eitherResponse = await service.request(requestModel: requestModel);

    expect(eitherResponse.isRight, isTrue);
    expect(eitherResponse.fold((_) {}, (m) => m),
        GetSideCashResponseModel.fromJson({"confirmation": "123456789"}));
  });
}
