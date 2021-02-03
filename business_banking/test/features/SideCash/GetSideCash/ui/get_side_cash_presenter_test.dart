import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_bloc.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_presenter.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/scheduler.dart';

main() {
  GetSideCashPresenter presenter;

  setUpAll(() {
    presenter = GetSideCashPresenter();
  });

  test("render GetSideCashScreen with null values", () async {
    final result = presenter.buildScreen(null, null, null);
    expect(result, isA<GetSideCashScreen>());
  });
  testWidgets("render GetSideCashScreen for get side cash success", () {
    final result = presenter.buildScreen(
        null, GetSideCashBloc(), GetSideCashViewModel(requestSuccess: true));

    expect(result, isA<GetSideCashScreen>());
  });
}
