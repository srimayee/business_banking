import 'package:clean_framework/clean_framework.dart';

class ForgotPasswordEntity extends Entity {
  final String email;

  ForgotPasswordEntity(
      {List<EntityFailure> errors = const [], String? email})
      : email = email ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [email, errors];

  @override
  merge({errors, String? email}) {
    return ForgotPasswordEntity(
        errors: errors ?? this.errors,
        email: email ?? this.email);
  }
}
