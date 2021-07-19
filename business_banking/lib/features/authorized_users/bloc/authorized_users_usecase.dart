import 'package:business_banking/features/authorized_users/bloc/authorized_users_service_adapter.dart';
import 'package:business_banking/features/authorized_users/model/authorized_users_entity.dart';
import 'package:business_banking/features/authorized_users/model/authorized_users_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../authorized_users_locator.dart';

class AuthorizedUsersUseCase extends UseCase {
  ViewModelCallback<AuthorizedUsersViewModel> _viewModelCallBack;
  RepositoryScope? _scope;

  AuthorizedUsersUseCase(this._viewModelCallBack);

  void fetchData() {
    _viewModelCallBack(AuthorizedUsersViewModel(authorizedUsers: []));
  }

  void create() async {
    _scope = AuthorizedUsersLocator().repository.containsScope<AuthorizedUsersEntity>();
    if (_scope == null) {
      final newEntity = AuthorizedUsersEntity(authorizedUsers: []);
      _scope = AuthorizedUsersLocator()
          .repository
          .create<AuthorizedUsersEntity>(newEntity, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }

    print('Before adapter call');
    await AuthorizedUsersLocator()
        .repository
        .runServiceAdapter(_scope!, AuthorizedUsersServiceAdapter());
    print('after adapter call');
    sendViewModelToSubscribers();
  }

  void sendViewModelToSubscribers() {
    AuthorizedUsersEntity responseEntity = AuthorizedUsersLocator().repository.get(_scope!);
    _notifySubscribers(responseEntity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  AuthorizedUsersViewModel buildViewModelForServiceUpdate(AuthorizedUsersEntity entity) {
    if (entity.hasErrors()) {
      return AuthorizedUsersViewModel(
          authorizedUsers: entity.authorizedUsers,
          serviceStatus: ServiceStatus.fail
      );
    } else {
      return AuthorizedUsersViewModel(
          authorizedUsers: entity.authorizedUsers,
          serviceStatus: ServiceStatus.success
      );
    }
  }

  AuthorizedUsersViewModel buildViewModelForLocalUpdate(AuthorizedUsersEntity entity) {
    return AuthorizedUsersViewModel(
      authorizedUsers: entity.authorizedUsers,
    );
  }

  AuthorizedUsersViewModel buildViewModelForLocalUpdateWithError(AuthorizedUsersEntity entity) {
    return AuthorizedUsersViewModel(
        authorizedUsers: entity.authorizedUsers
    );
  }
}
