import 'package:clean_framework/clean_framework.dart';

class EnrollmentFormViewModel extends ViewModel {
  //1
  final List<String> accounts;
  final String selectedAccount;
  final DateTime selectedStartDate;
  final DateTime firstAvailableStartDate;

  //2
  EnrollmentFormViewModel(
      {this.accounts,
      this.selectedAccount,
      this.selectedStartDate,
      this.firstAvailableStartDate})
   /*4*/   : assert(accounts != null && accounts?.isNotEmpty && firstAvailableStartDate != null);

  //3
  @override
  List<Object> get props => [
        accounts,
        selectedAccount,
        selectedStartDate,
        firstAvailableStartDate,
      ];
}
