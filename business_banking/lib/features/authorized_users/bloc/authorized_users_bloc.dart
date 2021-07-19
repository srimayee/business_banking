import 'package:business_banking/features/authorized_users/model/authorized_users_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

import 'authorized_users_usecase.dart';

class AuthorizedUsersBloc extends Bloc {
  late AuthorizedUsersUseCase _getAuthorizedUsersUseCase;

  final authorizedUsersModelPipe = Pipe<AuthorizedUsersViewModel>();

  AuthorizedUsersBloc() {
    _getAuthorizedUsersUseCase =
        AuthorizedUsersUseCase((viewModel) =>
            authorizedUsersModelPipe.send(viewModel as AuthorizedUsersViewModel));
    authorizedUsersModelPipe.whenListenedDo(() {
      _getAuthorizedUsersUseCase.create();
    });
    _getAuthorizedUsersUseCase.fetchData();
  }

  @override
  void dispose() {
    authorizedUsersModelPipe.dispose();
  }
}
