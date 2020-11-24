import 'package:clean_framework/clean_framework.dart';

enum AccountType { private, retail }

class HelloCustomerEntity extends Entity {
  final String honrsic;
  final String firstName;
  final String lastName;
  final String nickName;
  final AccountType accountType;

  HelloCustomerEntity(
      {List<EntityError> errors = const [],
      String honrsic,
      String firstName,
      String lastName,
      String nickName,
      AccountType accountType})
      : this.honrsic = honrsic ?? "",
        this.firstName = firstName ?? "",
        this.lastName = lastName ?? "",
        this.nickName = nickName ?? "",
        this.accountType = accountType ?? AccountType.private,
        super(errors: errors);

  @override
  List<Object> get props =>
      [errors, honrsic, firstName, lastName, nickName, accountType];

  @override
  merge(
      {errors,
      String honrsic,
      String firstName,
      String lastName,
      String nickName,
      String accountType}) {
    return HelloCustomerEntity(
        errors: errors ?? this.errors,
        honrsic: honrsic ?? this.honrsic,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nickName: nickName ?? this.nickName,
        accountType: accountType ?? this.accountType);
  }

  @override
  String toString() {
    return '$honrsic $firstName $lastName $nickName $accountType';
  }
}
