import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_request_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetSideCashRequestModel', () {
    test(
      "request model has amountRequested value",
      () {
        print(
            'side Cash props -> ' + GetSideCashRequestModel().props.toString());
        expect(GetSideCashRequestModel().props, [null]);
      },
    );
    test(
      "toJson will return proper json structure",
      () {
        final model = GetSideCashRequestModel();
        expect(model.toJson(), {'amountRequested': null});
      },
    );
  });
}
