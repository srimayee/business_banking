import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('GetSideCashEntity create new entity', () {
    final entity = GetSideCashEntity(amountRequested: "12.34");
    expect(entity.amountRequested, "12.34");
    expect(entity.errors, []);
  });

  test('GetSideCashEntity merge with errors => null', () {
    final entity = GetSideCashEntity(
      amountRequested: "12.34",
    );
    entity.merge(errors: null);
  });

  test('GetSideCashEntity props', () {
    final entity = GetSideCashEntity(
      amountRequested: "12.34",
    );
    expect(entity.props, ['12.34', []]);
  });
}
