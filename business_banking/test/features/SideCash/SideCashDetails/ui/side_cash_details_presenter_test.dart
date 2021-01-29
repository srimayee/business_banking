import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_presenter.dart';
import 'package:business_banking/features/side_cash/side_cash_details/ui/side_cash_details_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_navigation_observer.dart';

main() {
  SideCashDetailsPresenter presenter;
  MockNavigatorObserver mockNavigatorObserver;

  setUpAll(() {
    presenter = SideCashDetailsPresenter();
    mockNavigatorObserver = MockNavigatorObserver();
  });
  test("render SideCashDetailsScreen", () async {
    final result = presenter.buildScreen(null, null, null);
    expect(result, isA<SideCashDetailsScreen>());
  });
}
