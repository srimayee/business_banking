import 'package:clean_framework/clean_framework.dart';

class RequestMoneyEntity extends Entity {
  final String name;
  final String email;
  final String imageUrl;
  final double amount;
  final String memo;

  RequestMoneyEntity(
      {List<EntityFailure> errors = const [],
        String? name,
        String? email,
        String? imageUrl,
        double? amount,
        String? memo})
      : name = name ?? 'user name',
        email = email ??  'username@gmail.com',
        imageUrl = imageUrl ?? '',
        amount = amount ?? 0,
        memo = memo ?? 'this is a memo',
        super(errors: errors);

  @override
  List<Object> get props => [
    errors, name, email, imageUrl, amount, memo];

  @override
  merge({errors, String? name, String? email, String? imageUrl, double? amount,
        String? memo}) {
    return RequestMoneyEntity(
        errors: errors ?? this.errors,
        name: name ?? this.name,
        email: email ?? this.email,
        imageUrl: imageUrl ?? this.imageUrl,
        amount: amount ?? this.amount,
        memo: memo ?? this.memo,
    );
  }
}