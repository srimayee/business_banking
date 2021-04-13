import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'transaction_bloc_mock.dart';

void main() {
  test('TransactionBloc gets view model, mock', () {
    final bloc = TransactionBlocMock();

    bloc.transactionDetailsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TransactionViewModel>());
      expect(model.transactionDetails, [
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Boots',
            transactionId: '0000000',
            transactionCategory: 'shopping',
            payTo: "Merchant0",
            date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000))
      ]);
    }));
  });

  test('TransactionBloc gets view model, real', () {
    final bloc = TransactionBloc();

    bloc.transactionDetailsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TransactionViewModel>());
      expect(model.transactionDetails, [
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Europe Tripe',
            transactionId: '0000001',
            transactionCategory: 'airTravel',
            payTo: "Merchant1",
            date: DateTime.fromMillisecondsSinceEpoch(1618275504 * 1000)),
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Cat in the Hat',
            transactionId: '0000002',
            transactionCategory: 'movies',
            payTo: "Merchant2",
            date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000)),
        TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Olive Garden',
            transactionId: '0000003',
            transactionCategory: 'restaurant',
            payTo: "Merchant3",
            date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000)),
        TransactionModel(
            transactionAmount: '50.99',
            transactionTitle: 'Starbucks',
            transactionId: '0000004',
            transactionCategory: 'coffeeShop',
            payTo: "Merchant4",
            date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000)),
        TransactionModel(
            transactionAmount: '2000.23',
            transactionTitle: 'Paycheck',
            transactionId: '0000005',
            transactionCategory: 'income',
            payTo: "Merchant5",
            date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000)),
        TransactionModel(
            transactionAmount: '200.23',
            transactionTitle: 'Gas Station',
            transactionId: '0000006',
            transactionCategory: 'gas',
            payTo: "Merchant6",
            date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000)),
        TransactionModel(
            transactionAmount: '400.23',
            transactionTitle: 'The Gap',
            transactionId: '0000007',
            transactionCategory: 'shopping',
            payTo: "Merchant7",
            date: DateTime.fromMillisecondsSinceEpoch(1618363234 * 1000)),
        TransactionModel(
            transactionAmount: '300.00',
            transactionTitle: 'Princeton Tuition',
            transactionId: '0000008',
            transactionCategory: 'tuition',
            payTo: "Merchant8",
            date: DateTime.fromMillisecondsSinceEpoch(1618363234 * 1000)),
        TransactionModel(
            transactionAmount: '435.67',
            transactionTitle: 'Bus',
            transactionId: '0000009',
            transactionCategory: 'Transportation',
            payTo: "Merchant9",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '90.67',
            transactionTitle: 'Tennis Class',
            transactionId: '00000010',
            transactionCategory: 'Transportation',
            payTo: "Merchant10",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '50.67',
            transactionTitle: 'Barber Shop',
            transactionId: '00000011',
            transactionCategory: 'Haircut',
            payTo: "Merchant11",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '100.00',
            transactionTitle: 'Internet Bill',
            transactionId: '00000012',
            transactionCategory: 'Utilities',
            payTo: "Merchant12",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '120.00',
            transactionTitle: 'Dry Cleaning',
            transactionId: '00000013',
            transactionCategory: 'Utilities',
            payTo: "Merchant13",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '1200.00',
            transactionTitle: 'Rent',
            transactionId: '00000014',
            transactionCategory: 'Rent',
            payTo: "Merchant14",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '200.00',
            transactionTitle: 'Transfer Money',
            transactionId: '00000015',
            transactionCategory: 'Transfer',
            payTo: "Merchant15",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '300.00',
            transactionTitle: 'Veterans Donation',
            transactionId: '00000016',
            transactionCategory: 'Charity',
            payTo: "Merchant16",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '200.00',
            transactionTitle: 'Physical Exam',
            transactionId: '00000017',
            transactionCategory: 'Health',
            payTo: "Merchant17",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '140.00',
            transactionTitle: 'ATM Withdrawal',
            transactionId: '00000018',
            transactionCategory: 'Withdrawals',
            payTo: "Merchant18",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '30.00',
            transactionTitle: 'Streaming Subscription',
            transactionId: '00000019',
            transactionCategory: 'Subscriptions',
            payTo: "Merchant19",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
        TransactionModel(
            transactionAmount: '30.00',
            transactionTitle: 'Organic Groceries',
            transactionId: '00000020',
            transactionCategory: 'Groceries',
            payTo: "Merchant20",
            date: DateTime.fromMillisecondsSinceEpoch(1618449634 * 1000)),
      ]);
    }));
  });
}
