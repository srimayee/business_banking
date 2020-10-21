import 'package:business_banking/features/hello_customer_detail/bloc/hello_customer_detail_bloc.dart';
import 'package:business_banking/features/hello_customer_detail/model/hello_customer_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

const NAME = "Joe";
const DATETIME = "10/20/2020 13:00";

void main() {
  test('HelloCustomerDetailBloc gets view model, real', () {
    final bloc = HelloCustomerDetailBloc();

    bloc.helloCustomerDetailViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<HelloCustomerDetailViewModel>());
      expect(model.name, NAME);
      expect(model.currentTimeString, DATETIME);
    }));
  });
}
