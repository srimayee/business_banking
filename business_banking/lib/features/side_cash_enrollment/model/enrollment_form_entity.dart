import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/foundation.dart';

class EnrollmentFormEntity extends Entity {
  //1
  final List<String> accounts;
  final String selectedAccount;
  final DateTime selectedStartDate;
  final DateTime firstAvailableStartDate;

  //2
  EnrollmentFormEntity(
      {List<EntityFailure> errors = const [],
      this.accounts,
      this.selectedAccount,
      this.selectedStartDate,
      this.firstAvailableStartDate})
      //TODO should I be able to create an empty entity, shouldnt the Model be reponsible for filtering bad
      // data, not the entity?
      /*5   : assert(firstAvailableStartDate != null && accounts?.isNotEmpty && accounts != null,),*/
      : super(errors: errors);

  //3
  @override
  List<Object> get props => [
        accounts,
        selectedAccount,
        selectedStartDate,
        firstAvailableStartDate,
      ];

  //4
  @override
  merge({errors, String selectedAccount, DateTime selectedStartDate}) {
    final EnrollmentFormEntity mergedEntity = EnrollmentFormEntity(
      errors: errors ?? this.errors,
      selectedAccount: selectedAccount ?? this.selectedAccount,
      selectedStartDate: selectedStartDate ?? this.selectedStartDate,
      accounts: this.accounts,
      firstAvailableStartDate: this.firstAvailableStartDate,
    );
    return mergedEntity;
  }
}

/*{
  "accounts": ["savings-123", "checking-234"],
  "selected_account": ""
  "startDate": "",
  "firstAvaiableStartDate": "20210131T000000-0600"
}*/
