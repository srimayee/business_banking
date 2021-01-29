import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_response_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'SideCashDetailsService success',
    () async {
      final service = SideCashDetailsService();
      final response = await service.request();
      expect(response.isRight, isTrue);
      final result = response.fold((_) {}, (response) => response);
      expect(result, isA<SideCashDetailsResponseModel>());
    },
  );
}
