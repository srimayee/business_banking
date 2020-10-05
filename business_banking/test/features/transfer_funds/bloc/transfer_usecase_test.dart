import 'package:business_banking/features/transfer_funds/bloc/transfer_usecase.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testing UseCase', () async {
    TransferFundsViewModel model;
    TransferFundsUseCase useCase = TransferFundsUseCase((viewModel) {
      model = viewModel;
    });

    // testing create method
    await useCase.create();
    // TransferFundsViewModel modelToCompare = new TransferFundsViewModel(fromAccounts: ['1111111111', '2222222222', '3333333333']);
    expect(
        model,
        TransferFundsViewModel(
          fromAccounts: ['1111111111', '2222222222', '3333333333'],
        ));

    // testing updateFromAccount method
    await useCase.updateFromAccount('1111111111');
    expect(
        model,
        TransferFundsViewModel(
            fromAccounts: ['1111111111', '2222222222', '3333333333'],
            toAccounts: ['4444444444', '5555555555', '6666666666'],
            fromAccount: '1111111111'));

    // testing updateToAccount method
    useCase.updateToAccount('5555555555');
    expect(
        model,
        TransferFundsViewModel(
            fromAccounts: ['1111111111', '2222222222', '3333333333'],
            toAccounts: ['4444444444', '5555555555', '6666666666'],
            fromAccount: '1111111111',
            toAccount: '5555555555'));

    // testing updateAmount method
    // valid amount
    useCase.updateAmount('23.50');
    expect(
        model,
        TransferFundsViewModel(
            fromAccounts: ['1111111111', '2222222222', '3333333333'],
            toAccounts: ['4444444444', '5555555555', '6666666666'],
            fromAccount: '1111111111',
            toAccount: '5555555555',
            amount: 23.50));

    // invalid amount
    useCase.updateAmount('-2.4');
    expect(
        model,
        TransferFundsViewModel(
            fromAccounts: ['1111111111', '2222222222', '3333333333'],
            toAccounts: ['4444444444', '5555555555', '6666666666'],
            fromAccount: '1111111111',
            toAccount: '5555555555',
            amount: 23.50));

    // invalid amount
    useCase.updateAmount('abc');
    expect(
        model,
        TransferFundsViewModel(
            fromAccounts: ['1111111111', '2222222222', '3333333333'],
            toAccounts: ['4444444444', '5555555555', '6666666666'],
            fromAccount: '1111111111',
            toAccount: '5555555555',
            amount: 23.50));

    // testing updateDate method
    DateTime date = DateTime(2020);
    useCase.updateDate(date);
    TransferFundsViewModel modelForComparing = TransferFundsViewModel(
        fromAccounts: ['1111111111', '2222222222', '3333333333'],
        toAccounts: ['4444444444', '5555555555', '6666666666'],
        fromAccount: '1111111111',
        toAccount: '5555555555',
        amount: 23.50,
        date: date);
    expect(model, modelForComparing);
    expect(model.date, modelForComparing.date);

    // testing submitTransfer method
    bool result = await useCase.submitTransfer();
    expect(result, isTrue);
  });
}
