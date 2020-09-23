import 'package:business_banking/features/billpay/bloc/billpay_bloc.dart';
import 'package:business_banking/features/billpay/model/billpay_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BillPayBloc Test', () {
    final bloc = BillPayBloc();
    bloc.billPayViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<BillPayViewModel>());
      expect(model.amount, 0);
    }));
  });
}
