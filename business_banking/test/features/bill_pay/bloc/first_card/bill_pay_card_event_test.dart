// @dart=2.9
import 'package:business_banking/features/bill_pay/bloc/first_card/bill_pay_card_event.dart';
import 'package:test/test.dart';

void main() {
  group('Bill Pay Card Event', () {
    test('props should match and stringify be true on UpdateBillsDueEvent',
            () {
          final event = UpdateBillsDueEvent(4);
          expect(event.props, [4]);
          expect(event.stringify, true);
        });
  });
}
