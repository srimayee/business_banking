import 'package:clean_framework/clean_framework.dart';

class CashAccountsEntity extends Entity {
  final String name;
  final int lastFour;
  final double balance;
  
  CashAccountsEntity(
    {List<EntityError> errors = const [],
     String name,
     int lastFour,
     this.balance = 0.0})
    : name = name ?? '',
      lastFour = lastFour ?? 0000,
      super(errors: errors);
  
  @override
  List<Object> get props => [
    errors, name, lastFour, balance
  ];
  
  @override
  merge({errors, String name, int lastFour, double balance}) {
    return CashAccountsEntity(
      errors: errors ?? this.errors,
      name: name ?? this.name,
      lastFour: lastFour ?? this.lastFour,
      balance: balance ?? this.balance
    );
  }
}