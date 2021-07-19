
import 'package:business_banking/features/authorized_users/bloc/authorized_users_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'authorized_users_presenter.dart';

class AuthorizedUsersFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthorizedUsersBloc(),
      child: AuthorizedUsersPresenter(),
    );
  }
}
