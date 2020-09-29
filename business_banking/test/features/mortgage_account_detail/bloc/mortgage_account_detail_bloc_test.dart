import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_bloc.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageAccountDetailBloc gets view model, real', () {
    final bloc = MortgageAccountDetailBloc();

    bloc.mortgageAccountDetailViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<MortgageAccountDetailViewModel>());
      expect(model.name, 'Employee Checking');
      expect(model.lastFour.toString(), '6542');
      expect(model.balance.toString(), '3545.54');
      expect(model.accountType, 'Employee Checking');
      expect(model.routingNumber.toString(), '746395735');
      expect(model.beginningBalance.toString(), '3674.43');
      expect(model.pendingTransactions.toString(), '-128.89');
      expect(model.depositHolds.toStringAsFixed(2), '0.00');
    }));
  });
}
