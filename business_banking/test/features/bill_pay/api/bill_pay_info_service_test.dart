
import 'package:business_banking/features/bill_pay/api/models/bill_pay_info/bill_pay_info_response_model.dart';
import 'package:business_banking/features/bill_pay/api/services/bill_pay_info_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Bill Pay Service Succeess', () async {

    final service = BillPayInfoService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        BillPayInfoResponseModel.fromJson({
          "accounts": [
            {
              "account_title": "Checking Account",
              "account_number": "6542",
              "account_balance": 3545.54,
              "account_status": "Active"
            },
            {
              "account_title": "Savings Account",
              "account_number": "6543",
              "account_balance": 0.02,
              "account_status": "Active"
            }
          ],
          "billers": [
            {
              "biller_name": "Gas Company",
              "account_number": "9582"
            },
            {
              "biller_name": "Internet Company",
              "account_number": "6237"
            },
            {
              "biller_name": "Water Company",
              "account_number": "6092"
            },
            {
              "biller_name": "Electric Company",
              "account_number": "6129"
            },
          ],
          "rules": {
            "memo_limit": 256,
            "payment_min": 1.00,
            "payment_max": 100000.00
          }
        }));
  });
}
