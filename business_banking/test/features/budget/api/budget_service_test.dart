import 'package:business_banking/features/budget/api/accounts_json_response_model.dart';
import 'package:business_banking/features/budget/api/accounts_service.dart';
import 'package:business_banking/features/budget/api/transactions_json_response_model.dart';
import 'package:business_banking/features/budget/api/transactions_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AccountsService path', () async {
    final service = AccountsService();
    expect(service.path, 'accounts');
  });

  test('AccountsService parseResponse', () async {
    final json = {
      "status": "ok",
      "totalResults": 2,
      "accounts": [
        {
          "accountCategory": "CHECKINGACCOUNT",
          "accountNumber": "1234567890122345",
          "availableBalance": 281.84,
          "accountNickname": "HNB Personal Checking (2345)"
        },
        {
          "accountCategory": "LOANACCOUNT",
          "accountNumber": "1234567890126917",
          "availableBalance": 481.84,
          "accountNickname": "HNB Credit Card (6917)"
        }
      ]
    };
    final service = AccountsService();
    AccountsJsonResponseModel response = service.parseResponse(json);
    expect(response, isA<AccountsJsonResponseModel>());
  });

  test('TransactionsService path', () async {
    final service = TransactionsService();
    expect(service.path, 'transactions');
  });

  test('TransactionsService parseResponse', () async {
    final json = {
      "postedTransactions": [
        {
          "transactionDate": "04/13/2021 00:00:00",
          "description": "LYFT RIDE",
          "debitAmount": 18.0,
          "category": "Ground Transportation",
          "cardNumber": "xxxx-xxxx-xxxx-6917"
        },
        {
          "transactionDate": "04/13/2021 00:00:00",
          "description": "US POSTAL SERVICE",
          "debitAmount": 12.0,
          "category": "Others",
          "cardNumber": "xxxx-xxxx-xxxx-6917"
        }
      ]
    };
    final service = TransactionsService();
    TransactionsJsonResponseModel response = service.parseResponse(json);
    expect(response, isA<TransactionsJsonResponseModel>());
  });
}
