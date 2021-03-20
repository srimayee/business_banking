import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('QRCodeGeneratorViewModel initialize without errors', () {
    final viewModel = QRCodeGeneratorViewModel(
        seed: '2a6abu', expiresAt: '2080-02-18T23:42:30.802Z');
    expect(viewModel.seed, '2a6abu');
    expect(viewModel.expiresAt, '2080-02-18T23:42:30.802Z');

    expect(viewModel.props, [viewModel.seed, viewModel.expiresAt]);
  });
  test('QRCodeGeneratorViewModel initialize with error', () {
    try {
      QRCodeGeneratorViewModel(seed: null, expiresAt: null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
