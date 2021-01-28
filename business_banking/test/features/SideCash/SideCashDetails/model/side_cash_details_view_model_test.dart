import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:test/test.dart';
import 'package:flutter_test/flutter_test.dart' as testing;

void main() {
  group('SideCashDetailsViewModel test group', () {
    test('test props', () {
      final sideCashDetailsViewModel = SideCashDetailsViewModel(
        grossSideCashBalance: "1234.56",
        interest: "12.34",
        paymentMin: "23.45",
        remainingCredit: "345.67",
      );

      expect(sideCashDetailsViewModel.props,
          ['1234.56', '12.34', '23.45', '345.67']);
    });
  });
}
