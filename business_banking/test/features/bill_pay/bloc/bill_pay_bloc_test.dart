import 'package:business_banking/features/account_detail/bloc/account_detail_bloc.dart';
import 'package:business_banking/features/account_detail/model/account_detail_view_model.dart';
import 'package:business_banking/features/billpay/bloc/bill_pay_bloc.dart';
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
