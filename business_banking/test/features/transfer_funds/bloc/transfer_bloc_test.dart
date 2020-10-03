import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  TransferFundsBloc bloc;

  setUp(() {
    bloc = TransferFundsBloc();
  });

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
  });

  test('testing fromAccountPipe', () async {
    //testing fromAccountPipe
    bloc.fromAccountPipe.receive.listen(expectAsync1((account) {
      expect(account, isA<String>());
      expect(account, '1111111111');
    }));
    bloc.fromAccountPipe.send('1111111111');
  });
}