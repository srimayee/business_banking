import 'package:business_banking/features/customer/api/customer_service.dart';
import 'package:business_banking/features/customer/api/customer_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

void main() {
  test('CustomerService success', () async {
    final service = CustomerService();
    final Either<ServiceFailure, CustomerServiceResponseModel> eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        CustomerServiceResponseModel.fromJson({
          "honrsic": "Mr.",
          "firstName": "Joe",
          "lastName": "A",
          "accountType": "private",
          "nickName": "",
          "address": "1234 ABCD Rd, City, State 00000",
        }));
  });
}
