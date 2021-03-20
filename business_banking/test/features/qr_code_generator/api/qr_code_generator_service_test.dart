import 'package:business_banking/features/qr_code_generator/api/qr_code_generator_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  QRCodeGeneratorService service;
  setUp(() {
    QRCodeGeneratorService.mockService = true;
    service = QRCodeGeneratorService();
  });

  test('QRCodeGeneratorService success', () async {
    final eitherResponse = await service.request();
    expect(eitherResponse.isRight, isTrue);

    expect(eitherResponse.fold((_) {}, (m) => m).expiresAt,
        '2080-02-18T23:42:30.802Z');
    expect(eitherResponse.fold((_) {}, (m) => m).seed, '2a6abu');
  });
}
