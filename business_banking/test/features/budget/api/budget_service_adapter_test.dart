// @dart=2.9

import 'package:business_banking/features/budget/api/accounts_json_response_model.dart';
import 'package:business_banking/features/budget/api/transactions_json_response_model.dart';
import 'package:business_banking/features/budget/bloc/accounts_service_adapter.dart';
import 'package:business_banking/features/budget/bloc/transactions_service_adapter.dart';
import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testing budget entity creation by AccountsServiceAdapter', () {
    final entity = AccountsServiceAdapter().createEntity(
        BudgetEntity(),
        AccountsJsonResponseModel.fromJson({
          "status": "ok",
          "totalResults": 2,
          "accounts": [
            {
              "accountCategory": "CHECKINGACCOUNT",
              "accountNumber": "1234567890122345",
              "availableBalance": 281.84,
              "accountNickname": "HNB Personal Checking (2345)"
            }
          ]
        }));

    expect(entity.accounts.first.accountNumber, '1234567890122345');
    expect(entity.accounts.first.availableBalance, 281.84);
    expect(
        entity.accounts.first.accountNickname, 'HNB Personal Checking (2345)');
  });

  test('testing budget entity creation by TransactionsServiceAdapter', () {
    final entity = TransactionsServiceAdapter().createEntity(
        BudgetEntity(),
        TransactionsJsonResponseModel.fromJson({
          "postedTransactions": [
            {
              "transactionDate": "04/13/2021 00:00:00",
              "description": "US POSTAL SERVICE",
              "debitAmount": 12.0,
              "category": "Others",
              "cardNumber": "xxxx-xxxx-xxxx-6917"
            }
          ]
        }));

    expect(entity.allTransactions.first.description, 'US POSTAL SERVICE');
    expect(entity.allTransactions.first.debitAmount, 12.0);
    expect(entity.allTransactions.first.category, 'Others');
  });
}
