import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  TransferFundsBloc bloc;

  test('testing transferFundsViewModelPipe', () async {

    // testing transferFundsViewModelPipe
    bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TransferFundsViewModel>());
      expect(model.fromAccounts, ['1111111111', '2222222222', '3333333333']);
      expect(model.toAccounts, null);
      expect(model.fromAccount, null);
      expect(model.toAccount, null);
      expect(model.amount, 0);
      expect(model.id, null);
    },));
  }, timeout: Timeout(Duration(seconds: 3)));

  test('testing fromAccountPipe', () async {
    final bloc = TransferFundsBloc();
    int counter = 0;

    bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TransferFundsViewModel>());
      expect(model.fromAccounts, ['1111111111', '2222222222', '3333333333']);
      expect(model.toAccounts, null);
      if (counter < 1) {
        expect(model.fromAccount, null);
      }
      else {
        expect(model.fromAccount, '1111111111');
      }
      expect(model.toAccount, null);
      expect(model.amount, 0);
      expect(model.id, null);
      counter++;
      bloc.fromAccountPipe.send('1111111111');
    }, count: 2),);
  }, timeout: Timeout(Duration(seconds: 3)));
}