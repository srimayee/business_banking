import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:clean_framework/clean_framework.dart';

class ListTransactionsViewModel extends ViewModel {
  final List<PostedTransactions> filteredTransactions;

  ListTransactionsViewModel({required this.filteredTransactions});

  @override
  // TODO: implement props
  List<Object?> get props => [filteredTransactions];
}
