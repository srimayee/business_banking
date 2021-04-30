// @dart=2.9

import 'package:business_banking/features/budget/api/transactions_json_response_model.dart';
import 'package:business_banking/features/budget/bloc/budget_service_adapter.dart';
import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testing budget entity creation by service adaptor', () {
    final entity = BudgetServiceAdapter().createEntity(
        BudgetEntity(),
        TransactionsJsonResponseModel.fromJson({
          "accountInfo": {
            "accountCategory": "LOANACCOUNT",
            "accountNumber": "1234567890126917",
            "availableBalance": 481.84,
            "accountNickname": "HNB Credit Card (6917)"
          },
          "postedTransactions": [
            {
              "transactionDate": "04/13/2021 00:00:00",
              "description": "LYFT RIDE",
              "debitAmount": 18.0,
              "category": "Ground Transportation",
              "cardNumber": "xxxx-xxxx-xxxx-6917"
            },
          ]
        }));

    expect(entity.accountInfo.accountNumber, '1234567890126917');
    expect(entity.accountInfo.availableBalance, 481.84);
    expect(entity.accountInfo.accountNickname, 'HNB Credit Card (6917)');
    expect(entity.allTransactions.first.description, 'LYFT RIDE');
    expect(entity.allTransactions.first.debitAmount, 18.0);
    expect(entity.allTransactions.first.category, 'Ground Transportation');
  });
}
