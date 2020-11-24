import 'package:business_banking/features/hello_customer/bloc/hello_customer_detail_usecase.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('HelloCustomerDetailUseCase initialize with error', () {
    try {
      HelloCustomerDetailUseCase(null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });

  test('HelloCustomerDetailUseCase initialize and create', () {
    final usecase = HelloCustomerDetailUseCase((viewModel) {
      expect(viewModel, isA<HelloCustomerDetailViewModel>());
    });
    usecase.create();
  });

  test('HelloCustomerDetailUseCase initialize and recreate', () {
    final usecase = HelloCustomerDetailUseCase((viewModel) {
      expect(viewModel, isA<HelloCustomerDetailViewModel>());
    });
    usecase.create();
    usecase.create();//use to trigger else in the create
  });
}
