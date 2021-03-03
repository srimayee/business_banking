import 'package:business_banking/features/customer/bloc/customer_bloc.dart';
import 'package:business_banking/features/customer/model/customer_view_model.dart';
import 'package:business_banking/features/customer/model/customer_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CustomerBloc gets customer view model, real', () {
    final bloc = CustomerBloc();

    bloc.customerViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<CustomerViewModel>());
      expect(model.helloString, "Mr. Joe A");
    }));
  });

  test('CustomerBloc gets customer detail view model, real', () {
    final bloc = CustomerBloc();

    bloc.customerDetailViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<CustomerDetailViewModel>());
      expect(model.honorific, "Mr.");
      expect(model.name, "Joe A");
      expect(model.address, "1234 ABCD Rd, City, State 00000");
    }));
  });
}
