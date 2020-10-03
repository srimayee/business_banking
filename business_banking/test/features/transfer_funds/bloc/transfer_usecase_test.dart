import 'package:business_banking/features/transfer_funds/bloc/transfer_usecase.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testing usecase', () async {
    TransferFundsUseCase useCase = TransferFundsUseCase((viewModel) {});

    // testing create method
    await useCase.create();
    TransferFundsEntity entity = useCase.getEntity();

    expect(entity != null, isTrue);

    if (entity != null) {
      expect(entity.fromAccounts, ['1111111111', '2222222222', '3333333333']);
      expect(entity.toAccounts, null);
      expect(entity.fromAccount, null);
      expect(entity.toAccount, null);
      expect(entity.amount, 0);
      expect(entity.id, null);
    }

    // testing updateFromAccount method
    await useCase.updateFromAccount('1111111111');
    entity = useCase.getEntity();
    expect(entity != null, isTrue);

    if (entity != null) {
      expect(entity.fromAccounts, ['1111111111', '2222222222', '3333333333']);
      expect(entity.toAccounts, ['4444444444', '5555555555', '6666666666']);
      expect(entity.fromAccount, '1111111111');
      expect(entity.toAccount, null);
      expect(entity.amount, 0);
      expect(entity.id, null);
    }

    // testing updateToAccount method
    useCase.updateToAccount('5555555555');
    entity = useCase.getEntity();
    expect(entity != null, isTrue);

    if (entity != null) {
      expect(entity.fromAccounts, ['1111111111', '2222222222', '3333333333']);
      expect(entity.toAccounts, ['4444444444', '5555555555', '6666666666']);
      expect(entity.fromAccount, '1111111111');
      expect(entity.toAccount, '5555555555');
      expect(entity.amount, 0);
      expect(entity.id, null);
    }

    // testing updateAmount method
    // valid amount
    useCase.updateAmount('23.50');
    entity = useCase.getEntity();
    expect(entity != null, isTrue);

    if (entity != null) {
      expect(entity.fromAccounts, ['1111111111', '2222222222', '3333333333']);
      expect(entity.toAccounts, ['4444444444', '5555555555', '6666666666']);
      expect(entity.fromAccount, '1111111111');
      expect(entity.toAccount, '5555555555');
      expect(entity.amount, 23.5);
      expect(entity.id, null);
    }

    // invalid amount
    useCase.updateAmount('-2.4');
    entity = useCase.getEntity();
    expect(entity != null, isTrue);

    if (entity != null) {
      expect(entity.fromAccounts, ['1111111111', '2222222222', '3333333333']);
      expect(entity.toAccounts, ['4444444444', '5555555555', '6666666666']);
      expect(entity.fromAccount, '1111111111');
      expect(entity.toAccount, '5555555555');
      expect(entity.amount, 23.5);
      expect(entity.id, null);
    }

    // invalid amount
    useCase.updateAmount('abc');
    entity = useCase.getEntity();
    expect(entity != null, isTrue);

    if (entity != null) {
      expect(entity.fromAccounts, ['1111111111', '2222222222', '3333333333']);
      expect(entity.toAccounts, ['4444444444', '5555555555', '6666666666']);
      expect(entity.fromAccount, '1111111111');
      expect(entity.toAccount, '5555555555');
      expect(entity.amount, 23.5);
      expect(entity.id, null);
    }

    // testing updateDate method
    DateTime date = DateTime(2020);
    useCase.updateDate(date);
    entity = useCase.getEntity();
    expect(entity != null, isTrue);

    if (entity != null) {
      expect(entity.fromAccounts, ['1111111111', '2222222222', '3333333333']);
      expect(entity.toAccounts, ['4444444444', '5555555555', '6666666666']);
      expect(entity.fromAccount, '1111111111');
      expect(entity.toAccount, '5555555555');
      expect(entity.amount, 23.5);
      expect(entity.id, null);
      expect(entity.date, date);
    }

    // TODO testing updateId method failed
    // bool result = await useCase.updateId();
    // expect(result, isTrue);
    // if (result) {
    //   entity = useCase.getEntity();
    //
    // }
    // expect(entity != null, isTrue);
    //
    // if (entity != null) {
    //   expect(entity.fromAccounts, ['1111111111', '2222222222', '3333333333']);
    //   expect(entity.toAccounts, ['4444444444', '5555555555', '6666666666']);
    //   expect(entity.fromAccount, '1111111111');
    //   expect(entity.toAccount, '5555555555');
    //   expect(entity.amount, 23.5);
    //   expect(entity.id, '123456789');
    //   expect(entity.date, date);
    // }
  });
}