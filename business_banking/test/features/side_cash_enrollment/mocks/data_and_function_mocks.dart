import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_form_usecase.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_entity.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';

import '../../../../lib/locator.dart';

class DummyFunctions {
  formVMCallback(ViewModel) {}

  advertisementVMCallback(ViewModel) {}

  getRepoScope() {}

  RepositoryScope createScope(Function notifySubscribers) {
    print("create scope called in dummy functions");

    notifySubscribers();

    print("notify subscribers called in create scope dummy");
  }
}

class MockDummyFunctions extends Mock implements DummyFunctions {}

final String jsonDataAdvertisement = """
      {
        "message": "sign up for side cash!"
     
      }
  """;

String get serviceJson => """
{
  "accounts": [
    "savings-123",
    "checking-234"
  ],
  "firstAvailableStartDate": "20210131T000000-0600"
}
""";

EnrollmentFormEntity initialEntity(
    {bool accountsEmpty = false,
    bool accountsNull = false,
    firstAvailableStartDateNull = false}) {
  List<String> accounts = [
    "savings-123",
    "checking-234",
  ];

  DateTime firstAvailableStartDate = DateTime.parse("20210131T000000-0600");

  if (accountsEmpty) accounts = [];
  if (accountsNull) accounts = null;
  if (firstAvailableStartDateNull) firstAvailableStartDate = null;

  return EnrollmentFormEntity(
    accounts: accounts,
    selectedAccount: null,
    selectedStartDate: null,
    firstAvailableStartDate: firstAvailableStartDate,
  );
}

EnrollmentFormViewModel initialViewModel({
  firstAvailableStartDateNull = false,
  accountsNull = false,
  accountsEmpty = false,
}) {
  List<String> accounts = [
    "savings-123",
    "checking-234",
  ];

  DateTime firstAvailableStartDate = DateTime.parse("20210131T000000-0600");

  if (accountsEmpty) accounts = [];
  if (accountsNull) accounts = null;
  if (firstAvailableStartDateNull) firstAvailableStartDate = null;

  return EnrollmentFormViewModel(
      accounts: accounts,
      selectedAccount: null,
      selectedStartDate: null,
      firstAvailableStartDate: firstAvailableStartDate);
}
