import 'package:business_banking/features/card_usage/bloc/card_summary_bloc.dart';
import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'card_summary_bloc_mock.dart';

void main() {
  test('TransactionBloc gets view model, mock', () {
    final bloc = TransactionBlocMock();

    bloc.transactionDetailsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<CardSummaryViewModel>());
      expect(model.cardTransactions, [
        CardSummaryModel(
            debit: true,
            transactionAmount: 9.99,
            transactionTitle: 'Boots',
            transactionId: '0000000',
            transactionCategory: 'shopping',
            payTo: "Merchant0",
            date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000))
      ]);
    }));
  });

  test('TransactionBloc gets view model, real', () {
    final bloc = CardSummaryBloc();

    bloc.transactionDetailsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<CardSummaryViewModel>());
      expect(model.cardTransactions, [
        CardSummaryModel(
            debit: false,
            transactionAmount: 219.99,
            transactionTitle: 'Vacations Trip',
            transactionId: '0000001',
            transactionCategory: 'airTravel',
            payTo: "Merchant1",
            date: DateTime.fromMillisecondsSinceEpoch(1619944222 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 219.99,
            transactionTitle: 'Bahamas Cruise',
            transactionId: '0000101',
            transactionCategory: 'airTravel',
            payTo: "Merchant1",
            date: DateTime.fromMillisecondsSinceEpoch(1619944222 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 129.99,
            transactionTitle: 'Theater',
            transactionId: '0000002',
            transactionCategory: 'movies',
            payTo: "Merchant2",
            date: DateTime.fromMillisecondsSinceEpoch(1619944220 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 9.99,
            transactionTitle: 'Friday Dinner',
            transactionId: '0000003',
            transactionCategory: 'restaurant',
            payTo: "Merchant3",
            date: DateTime.fromMillisecondsSinceEpoch(1619944220 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 50.99,
            transactionTitle: 'Cappuccino',
            transactionId: '0000004',
            transactionCategory: 'coffeeShop',
            payTo: "Merchant4",
            date: DateTime.fromMillisecondsSinceEpoch(1620030620 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 200.23,
            transactionTitle: 'Gas',
            transactionId: '0000006',
            transactionCategory: 'gas',
            payTo: "Merchant6",
            date: DateTime.fromMillisecondsSinceEpoch(1620117020 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 400.23,
            transactionTitle: 'Shirt Store',
            transactionId: '0000007',
            transactionCategory: 'shopping',
            payTo: "Merchant7",
            date: DateTime.fromMillisecondsSinceEpoch(1620203420 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 300.00,
            transactionTitle: 'Harvard',
            transactionId: '0000008',
            transactionCategory: 'tuition',
            payTo: "Merchant8",
            date: DateTime.fromMillisecondsSinceEpoch(1620203420 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 335.67,
            transactionTitle: 'Bus',
            transactionId: '00000009',
            transactionCategory: 'transportation',
            payTo: "Merchant9",
            date: DateTime.fromMillisecondsSinceEpoch(1620203420 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 50.67,
            transactionTitle: 'Tennis Class',
            transactionId: '00000010',
            transactionCategory: 'miscellaneous',
            payTo: "Merchant10",
            date: DateTime.fromMillisecondsSinceEpoch(1620289820 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 50.67,
            transactionTitle: 'Barber Shop',
            transactionId: '00000011',
            transactionCategory: 'haircut',
            payTo: "Merchant11",
            date: DateTime.fromMillisecondsSinceEpoch(1620289820 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 50.00,
            transactionTitle: 'Internet Bill',
            transactionId: '00000012',
            transactionCategory: 'utilities',
            payTo: "Merchant12",
            date: DateTime.fromMillisecondsSinceEpoch(1620289820 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 120.00,
            transactionTitle: 'Gardener',
            transactionId: '00000013',
            transactionCategory: 'service',
            payTo: "Merchant13",
            date: DateTime.fromMillisecondsSinceEpoch(1620376220 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 100.00,
            transactionTitle: 'Veterans Donation',
            transactionId: '00000016',
            transactionCategory: 'charity',
            payTo: "Merchant16",
            date: DateTime.fromMillisecondsSinceEpoch(1620462620 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 200.00,
            transactionTitle: 'Physical Exam',
            transactionId: '00000017',
            transactionCategory: 'health',
            payTo: "Merchant17",
            date: DateTime.fromMillisecondsSinceEpoch(1620462620 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 140.00,
            transactionTitle: 'ATM Withdrawal',
            transactionId: '00000018',
            transactionCategory: 'withdrawals',
            payTo: "Merchant18",
            date: DateTime.fromMillisecondsSinceEpoch(1620462620 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 30.00,
            transactionTitle: 'Streaming Subscription',
            transactionId: '00000019',
            transactionCategory: 'subscriptions',
            payTo: "Merchant19",
            date: DateTime.fromMillisecondsSinceEpoch(1620462620 * 1000)),
        CardSummaryModel(
            debit: false,
            transactionAmount: 30.00,
            transactionTitle: 'Organic Groceries',
            transactionId: '00000020',
            transactionCategory: 'groceries',
            payTo: "Merchant20",
            date: DateTime.fromMillisecondsSinceEpoch(1620462620 * 1000)),
      ]);
    }));
  });
}
