import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SideCashDetailsEntity create new entity', () {
    final entity = SideCashDetailsEntity(
      grossSideCashBalance: "1234.56",
      interest: "12.34",
      paymentMin: "23.45",
      remainingCredit: "345.67",
    );
    expect(entity.grossSideCashBalance, "1234.56");
    expect(entity.interest, "12.34");
    expect(entity.paymentMin, "23.45");
    expect(entity.remainingCredit, "345.67");
    expect(entity.errors, []);
  });

  test('SideCashDetailsEntity merge with errors => null', () {
    final entity = SideCashDetailsEntity(
      grossSideCashBalance: "1234.56",
      interest: "12.34",
      paymentMin: "23.45",
      remainingCredit: "345.67",
    );
    entity.merge(errors: null);
  });

  test('SideCashDetailsEntity props', () {
    final entity = SideCashDetailsEntity(
      grossSideCashBalance: "1234.56",
      interest: "12.34",
      paymentMin: "23.45",
      remainingCredit: "345.67",
    );
    expect(entity.props, ['1234.56', '12.34', '23.45', '345.67', []]);
  });
}
