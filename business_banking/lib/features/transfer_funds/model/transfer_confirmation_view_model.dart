import 'package:clean_framework/clean_framework.dart';
import 'package:equatable/equatable.dart';

class TransferConfirmationViewModel extends ViewModel {
  final String? fromAccount;
  final String? toAccount;
  final String? amount;
  final DateTime? date;
  final String? id;

  TransferConfirmationViewModel(
      {this.fromAccount, this.toAccount, this.amount, this.date, this.id})
      : assert(amount != null && date is DateTime);

  @override
  List<Object?> get props => [fromAccount, toAccount, amount, date, id];
}
