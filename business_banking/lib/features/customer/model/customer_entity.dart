import 'package:clean_framework/clean_framework.dart';

enum AccountType { private, retail }

class CustomerEntity extends Entity {
  final String honorific;
  final String firstName;
  final String lastName;
  final String nickName;
  final AccountType accountType;
  final String address;

  CustomerEntity(
      {List<EntityFailure> errors = const [],
      String honorific,
      String firstName,
      String lastName,
      String nickName,
      AccountType accountType,
      String address})
      : this.honorific = honorific ?? "",
        this.firstName = firstName ?? "",
        this.lastName = lastName ?? "",
        this.nickName = nickName ?? "",
        this.accountType = accountType ?? AccountType.private,
        this.address = address ?? "",
        super(errors: errors);

  @override
  List<Object> get props =>
      [errors, honorific, firstName, lastName, nickName, accountType, address];

  @override
  merge(
      {errors,
      String honorific,
      String firstName,
      String lastName,
      String nickName,
      String accountType,
      String address}) {
    return CustomerEntity(
        errors: errors ?? this.errors,
        honorific: honorific ?? this.honorific,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nickName: nickName ?? this.nickName,
        accountType: accountType ?? this.accountType,
        address: address ?? this.address);
  }

  @override
  String toString() {
    return '$honorific $firstName $lastName $nickName $accountType $address';
  }
}
