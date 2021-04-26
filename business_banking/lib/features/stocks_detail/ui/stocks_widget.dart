import 'package:business_banking/features/stocks_detail/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_detail/ui/stocks_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StocksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StocksBloc>(
        create: (_) => StocksBloc(), child: StocksPresenter());
  }
}
