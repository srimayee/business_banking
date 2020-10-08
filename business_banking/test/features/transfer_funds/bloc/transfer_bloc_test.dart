import 'dart:io';

import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  bool debugEnabled = true;

  final TransferFundsBloc bloc = new TransferFundsBloc();

  // This tests all the initial values when the Screen loads for the
  // first time
  test('testing transferFundsViewModelPipe', () async {
    // Create TransferFundsViewModel Object with Data Values
    TransferFundsViewModel tranferFundsViewModel = TransferFundsViewModel(
        fromAccounts: ['1111111111', '2222222222', '3333333333']);

    // testing transferFundsViewModelPipe
    bloc.transferFundsViewModelPipe.receive.listen(expectAsync1(
          (model) {
        // Are the models same?
        expect(model, isA<TransferFundsViewModel>());

        // Are the values the same?
        expect(model.fromAccounts, tranferFundsViewModel.fromAccounts);
        expect(model.toAccounts, tranferFundsViewModel.toAccounts);
        expect(model.fromAccount, tranferFundsViewModel.fromAccount);
        expect(model.toAccount, tranferFundsViewModel.toAccount);
        expect(model.amount, tranferFundsViewModel.amount);
        expect(model.id, tranferFundsViewModel.id);
      },
    ));
  }, timeout: Timeout(Duration(seconds: 3)));

  // This tests the from account value sent through the pipe
  test('testing fromAccountPipe', () async {

    // Setup a Listener to receive specific pipe data
    createFromAccountPipeListener(bloc, debugEnabled);

    // Providing the From Account Value and send through the pipe
    // to receiver.
    bloc.fromAccountPipe.send('1111111111');
  }, timeout: Timeout(Duration(seconds: 3)));

  test('testing toAccountPipe', () async {
    /// Setup a Listener to receive specific pipe data
    createToAccountPipeListener(bloc, debugEnabled);

    // Providing the To Account Value and send through the pipe
    // to receiver.
    bloc.toAccountPipe.send('5555555555');
  }, timeout: Timeout(Duration(seconds: 3)));

  test('testing AmountPipe', () async {
    // Setup a Listener to receive specific pipe data
    createAmountPipeListener(bloc, debugEnabled);

    // Providing the Amount Value and send through the pipe
    // to receiver.
    bloc.amountPipe.send('25.4');
  }, timeout: Timeout(Duration(seconds: 3)));

  test('testing DatePipe', () async {
    // Setup a Listener to receive specific pipe data
    createAmountPipeListener(bloc, debugEnabled);

    // Providing the Date Value and send through the pipe
    // to receiver.
    bloc.datePipe.send(DateTime(2020));
  }, timeout: Timeout(Duration(seconds: 3)));

  test('testing SubmitPipe', () async {
    // Setup a Listener to receive specific pipe data
    createSubmitPipeListener(bloc, debugEnabled);

    // Providing the Date Value and send through the pipe
    // to receiver.
    bloc.submitPipe.launch();
  }, timeout: Timeout(Duration(seconds: 3)));
}

void createFromAccountPipeListener(TransferFundsBloc bloc, bool debugEnabled) {
  // Create Pipe Listener
  bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.fromAccount != null) {
      if (debugEnabled) {
        stderr.writeln("Testing FromAccountPipe: " + model.toString());
      }

      // Test the Receiving Pipe Data
      expect(model, isA<TransferFundsViewModel>());
      expect(model.fromAccount, '1111111111');
    }
  }));
}

void createToAccountPipeListener(TransferFundsBloc bloc, bool debugEnabled) {
  // Create Pipe Listener
  bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.fromAccount != null) {
      if (debugEnabled) {
        stderr.writeln("Testing ToAccountPipe: " + model.toString());
      }

      // Test the Receiving Pipe Data
      expect(model, isA<TransferFundsViewModel>());
      expect(model.toAccount, '5555555555');
    }
  }));
}

void createAmountPipeListener(TransferFundsBloc bloc, bool debugEnabled) {
  // Create Pipe Listener
  bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.fromAccount != null) {
      if (debugEnabled) {
        stderr.writeln("Testing AmountPipe: " + model.toString());
      }

      // Test the Receiving Pipe Data
      expect(model, isA<TransferFundsViewModel>());
      expect(model.amount, 25.4);
    }
  }));
}

void createDatePipeListener(TransferFundsBloc bloc, bool debugEnabled) {
  // Create Pipe Listener
  bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.fromAccount != null) {
      if (debugEnabled) {
        stderr.writeln("Testing DatePipe: " + model.toString());
      }

      // Test the Receiving Pipe Data
      expect(model, isA<TransferFundsViewModel>());
      expect(model.date, DateTime(2020));
    }
  }));
}

void createSubmitPipeListener(TransferFundsBloc bloc, bool debugEnabled) {
  // Create Pipe Listener
  bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.fromAccount != null) {
      if (debugEnabled) {
        stderr.writeln("Testing SubmitPipe: " + model.toString());
      }

      // Test the Receiving Pipe Data
      expect(model, isA<TransferFundsViewModel>());
      expect(model.id, '123456789');
    }
  }));
}