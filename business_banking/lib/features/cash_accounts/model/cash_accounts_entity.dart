import 'package:clean_framework/clean_framework.dart';

class CashAccountsEntity extends Entity {
  final String name;
  final String lastFour;
  final double balance;

  CashAccountsEntity({
    List<EntityFailure> errors = const [],
    String? name,
    String? lastFour,
    this.balance = 0.00,
  })  : name = name ?? 'Account',
        lastFour = lastFour ?? '0000',
        super(errors: errors);

  @override
  List<Object> get props => [errors, name, lastFour, balance];

  @override
  merge({errors, String? name, String? lastFour, double? balance}) {
    return CashAccountsEntity(
      errors: errors ?? this.errors,
      name: name ?? this.name,
      lastFour: lastFour ?? this.lastFour,
      balance: balance ?? this.balance,
    );
  }
}
