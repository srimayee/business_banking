import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('QRCodeGeneratorEntity properties', () {
    final entity = QRCodeGeneratorEntity(
      seed: '2a6abu',
      expiresAt: '2080-02-18T23:42:30.802Z',
    );
    expect(entity.seed, '2a6abu');
    expect(entity.expiresAt, '2080-02-18T23:42:30.802Z');
  });

  test('QRCodeGeneratorEntity merge with errors = null', () {
    final entity = QRCodeGeneratorEntity(
      errors: [],
      seed: '2a6abu',
      expiresAt: '2080-02-18T23:42:30.802Z',
    );
    final merged = entity.merge(errors: null);
    expect(merged.errors, []);
    expect(merged.seed, '2a6abu');
    expect(merged.expiresAt, '2080-02-18T23:42:30.802Z');
  });

  test('QRCodeGeneratorEntity merge with errors', () {
    final entity = QRCodeGeneratorEntity(
      errors: <EntityFailure>[GeneralEntityFailure()],
      seed: '',
      expiresAt: '',
    );
    final merged = entity.merge(
      errors: <EntityFailure>[GeneralEntityFailure()],
    );
    expect(merged.seed, '');
    expect(merged.expiresAt, '');
    expect(entity.hasErrors(), true);
  });
}
