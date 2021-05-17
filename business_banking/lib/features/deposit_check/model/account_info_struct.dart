import 'package:equatable/equatable.dart';

class AccountInfoStruct extends Equatable {
  final String accountNumber;
  final double availableBalance;
  final double depositLimit;
  final String accountNickname;

  AccountInfoStruct(
      {this.accountNumber = '',
      this.availableBalance = 0.0,
      this.depositLimit = 0.0,
      this.accountNickname = ''});

  @override
  List<Object> get props =>
      [accountNumber, availableBalance, depositLimit, accountNickname];
}
