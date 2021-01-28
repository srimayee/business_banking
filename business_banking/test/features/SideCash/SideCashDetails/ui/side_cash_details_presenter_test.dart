import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
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

  test("return proper viewModel", () async {
    final result = presenter.getViewModelStream(MockSideCashDetailsBloc());
    expect(result, isA<Stream<SideCashDetailsViewModel>>());
  });
}
