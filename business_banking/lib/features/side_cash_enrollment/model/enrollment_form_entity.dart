import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/foundation.dart';

class EnrollmentFormEntity extends Entity {
  //1
  final List<String> accounts;
  final String selectedAccount;
  final String submissionMessage;
  final bool submissionSuccess;

  //2
  EnrollmentFormEntity({
    List<EntityFailure> errors = const [],
    this.accounts,
    this.selectedAccount,
    this.submissionMessage,
    this.submissionSuccess,
  })
  //TODO should I be able to create an empty entity, shouldnt the Model be reponsible for filtering bad
  // data, not the entity?
  /*5   : assert(firstAvailableStartDate != null && accounts?.isNotEmpty && accounts != null,),*/
  : super(errors: errors);

  //3
  @override
  List<Object> get props => [
        accounts,
        selectedAccount,
        submissionMessage,
        submissionSuccess,
      ];

  //4
  @override
  merge(
      {errors,
      String selectedAccount,
      String submissionMessage,
      bool submissionSuccess}) {
    final EnrollmentFormEntity mergedEntity = EnrollmentFormEntity(
      errors: errors ?? this.errors,
      selectedAccount: selectedAccount ?? this.selectedAccount,
      accounts: this.accounts,
      submissionMessage: submissionMessage ?? this.submissionMessage,
      submissionSuccess: submissionSuccess ?? this.submissionSuccess,
    );
    return mergedEntity;
  }
}
