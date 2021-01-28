import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SideCashDetailsServiceRequestModel', () {
    test(
      "request model has no props",
      () {
        expect(SideCashDetailsRequestModel().props, []);
      },
    );
    test(
      "toJson will return proper json structure",
      () {
        final model = SideCashDetailsRequestModel();
        expect(model.toJson(), {});
      },
    );
  });
}
