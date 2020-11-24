import 'package:business_banking/features/hello_customer/bloc/hello_customer_usecase.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('HelloCustomerUseCase initialize with error', () {
    try {
      HelloCustomerUseCase(null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });

  test('HelloCustomerUseCase initialize and create', () {
    final usecase = HelloCustomerUseCase((viewModel) {
      expect(viewModel, isA<HelloCustomerViewModel>());
    });
    usecase.create();
  });

  test('HelloCustomerUseCase initialize and recreate', () {
    final usecase = HelloCustomerUseCase((viewModel) {
      expect(viewModel, isA<HelloCustomerViewModel>());
    });
    usecase.create();
    usecase.create();//use to trigger else in the create
  });
}
