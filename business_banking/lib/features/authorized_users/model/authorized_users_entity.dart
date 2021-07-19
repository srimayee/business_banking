import 'package:clean_framework/clean_framework.dart';

import 'AuthorizedUser.dart';

class AuthorizedUsersEntity extends Entity {
  final List<AuthorizedUser> authorizedUsers;

  AuthorizedUsersEntity(
      {List<EntityFailure> errors = const [], required List<AuthorizedUser>? authorizedUsers})
      : authorizedUsers = authorizedUsers ?? [],
        super(errors: errors);

  @override
  List<Object> get props => [authorizedUsers, errors];

  @override
  AuthorizedUsersEntity merge({errors, List<AuthorizedUser>? authorizedUsers}) {
    return AuthorizedUsersEntity(
        errors: errors ?? this.errors,
        authorizedUsers: authorizedUsers ?? this.authorizedUsers);
  }
}
