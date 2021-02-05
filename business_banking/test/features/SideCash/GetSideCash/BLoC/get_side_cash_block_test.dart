import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_bloc.dart';
import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_usecase.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../models/get_side_cash_view_model_test.dart';

main() {
  test('GetSideCashBloc gets view model', () {
    final bloc = GetSideCashBloc();
    bloc.viewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<GetSideCashViewModel>());
      bloc.dispose();
    }));
  });
  test('GetSideCashBloc gets string', () {
    final bloc = GetSideCashBloc();
    final usecase = GetSideCashUsecase((viewModel) {});
    usecase.create();

    bloc.requestValue.receive.listen(expectAsync1((amt) {
      expect(amt, '12');
      bloc.dispose();
    }));
    bloc.requestValue.send('12');
  });

  test('resetUsecase pipe should return a view model', () {
    final bloc = GetSideCashBloc();
    final usecase = GetSideCashUsecase((viewModel) {});
    usecase.create();

    bloc.resetUsecase.receive.listen(expectAsync1((event) {}));

    bloc.resetUsecase.launch();
  });

  test('Bloc validate input is false if input is falsy', () {
    final bloc = GetSideCashBloc();
    final isValid = bloc.validateInput('a');
    expect(isValid, false);
  });
  test('Bloc validate input is true if input is true', () {
    final bloc = GetSideCashBloc();
    final isValid = bloc.validateInput('12');
    expect(isValid, true);
  });
}
