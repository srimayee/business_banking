import 'package:business_banking/features/authorized_users/model/AuthorizedUser.dart';
import 'package:clean_framework/clean_framework.dart';

class AuthorizedUsersViewModel extends ViewModel {
  final List<AuthorizedUser> authorizedUsers;
  final serviceStatus;

  AuthorizedUsersViewModel({required this.authorizedUsers, this.serviceStatus = ServiceStatus.unknown});

  @override
  List<Object?> get props => [authorizedUsers, serviceStatus];
}

enum ServiceStatus { success, fail, unknown }
