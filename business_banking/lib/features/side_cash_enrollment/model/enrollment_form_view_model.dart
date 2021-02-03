import 'package:clean_framework/clean_framework.dart';

class EnrollmentFormViewModel extends ViewModel {
  //1
  final List<String> accounts;
  final String selectedAccount;


  //2
  EnrollmentFormViewModel(
      {this.accounts,
      this.selectedAccount,
   }) : assert(accounts != null);

  //3
  @override
  List<Object> get props => [
        accounts,
        selectedAccount,

      ];
}
