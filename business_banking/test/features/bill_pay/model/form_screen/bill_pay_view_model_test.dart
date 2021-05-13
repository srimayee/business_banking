// @dart=2.9
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BillPay View Model', () {

    var allBills = [
      Bill.fromJson({
        "id": 123,
        "payee": "AEP",
        "memo": "Electric bill",
        "amount": 216.88,
        "due": 1622793600000
      }),
      Bill.fromJson({
        "id": 124,
        "payee": "City of Columbus",
        "memo": "Water bill",
        "amount": 59.53,
        "due": 1620039600000
      }),
      Bill.fromJson({
        "id": 125,
        "payee": "City of Columbus",
        "memo": "Gas bill",
        "amount": 32,
        "due": 1621422000000
      }),
      Bill.fromJson({
        "id": 126,
        "payee": "Coinbase",
        "memo": "Monthly Bitcoin splurging",
        "amount": 14228.27,
        "due": 1621753200000
      })
    ];

    final tViewModel = BillPayViewModel(
        allBills: allBills,
        selectedBillIndex: -1,
        didSucceed: false,
        referenceNumber: '',
        serviceResponseStatus: ServiceResponseStatus.unknown);

    test('properties should match', () {
      expect(tViewModel.allBills, allBills);
      expect(tViewModel.selectedBillIndex, -1);
      expect(tViewModel.didSucceed, false);
      expect(tViewModel.referenceNumber, '');
      expect(tViewModel.serviceResponseStatus, ServiceResponseStatus.unknown);
    });

    test('props should match', () async {
      expect(tViewModel.props,
          [tViewModel.allBills, tViewModel.selectedBillIndex,
            tViewModel.serviceResponseStatus, tViewModel.didSucceed,
            tViewModel.referenceNumber]);
    });
  });
}
